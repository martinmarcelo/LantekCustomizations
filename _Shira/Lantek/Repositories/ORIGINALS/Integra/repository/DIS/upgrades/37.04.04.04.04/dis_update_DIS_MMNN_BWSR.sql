 
 --This code only is going to be executed if there is any quotation Job in Expert. There are three steps.
Declare
@HasQuote	int

SET @HasQuote = ISNULL((select top 1 DIS_MMNN_BWSR_00000100.NodeID
from DIS_MMNN_BWSR_00000100,DIS_MMNN_BWSR_00000200,DIS_MMNN_MMOO_00000200
where DIS_MMNN_BWSR_00000100.NodeID=DIS_MMNN_BWSR_00000200.BwsrID AND DIS_MMNN_BWSR_00000200.RecordID=DIS_MMNN_MMOO_00000200.RecID AND DIS_MMNN_MMOO_00000200.IsQuote=1 
GROUP BY DIS_MMNN_BWSR_00000100.NodeID),0)

If @HasQuote>0
BEGIN

--Step 1: Create a temporal table with OldNodes and Newnodes
    DECLARE 
        @TempNodeID             int,
        @TempRecID              int,
        @TempNewRecID           int,
        @Count                  int
    
	IF OBJECT_ID( N'tempdb..#RecIdTableVar') IS NOT NULL
	DROP TABLE #RecIdTableVar;
    CREATE TABLE #RecIdTableVar (OldNode int NOT NULL,NewNode int NOT NULL);
    SET @Count = 1;
    DECLARE CreateTemporalTableCursor CURSOR FOR
    SELECT [NodeID],[RecID] FROM [dbo].[DIS_MMNN_BWSR_00000100] ORDER BY [ParentID],[NodeID] ASC
    OPEN CreateTemporalTableCursor
    FETCH NEXT FROM CreateTemporalTableCursor into @TempNodeID,@TempRecID
        WHILE @@FETCH_STATUS = 0
	    BEGIN
                SET @TempNewRecID = (select MAX(NodeID) FROM DIS_MMNN_BWSR_00000100)+@Count
                Insert Into #RecIdTableVar (OldNode,NewNode) select @TempNodeID,@TempNewRecID    
                SET @Count = @Count + 1;            
            FETCH NEXT FROM CreateTemporalTableCursor into @TempNodeID,@TempRecID
        END		
    CLOSE CreateTemporalTableCursor
    DEALLOCATE CreateTemporalTableCursor

    --Step 2: Duplicate all the folders and put them BwsrType=3
    DECLARE 
	    @NodeName			nvarchar(255),
        @NodeID             int,
        @ParentID           int,
        @BwsrType           smallint,
        @CrtDate            datetime,
        @LastDate           datetime,
        @CrtUser            nvarchar(40),
        @LastUser           nvarchar(40),
        @Owner              nvarchar(40),
        @RecEnt             nvarchar(40),
        @RecOU              nvarchar(40),
        @RecID              int,
        @NewRecID           int
    

    DECLARE DuplicateFolderCursor CURSOR FOR
    SELECT [NodeName],[NodeID],[ParentID],[BwsrType],[CrtDate],[LastDate],[CrtUser],[LastUser],[Owner],[RecEnt],[RecOU],[RecID] FROM [dbo].[DIS_MMNN_BWSR_00000100] ORDER BY [ParentID],[NodeID] ASC
    OPEN DuplicateFolderCursor
    FETCH NEXT FROM DuplicateFolderCursor into @NodeName,@NodeID,@ParentID,@BwsrType,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecID
        WHILE @@FETCH_STATUS = 0
	    BEGIN
                SET @NewRecID = (select MAX(NodeID) FROM DIS_MMNN_BWSR_00000100)+1

                If @ParentID>0
                BEGIN
                    SET @ParentID = (select NewNode FROM #RecIdTableVar where OldNode = @ParentID)
                END
                INSERT INTO [dbo].[DIS_MMNN_BWSR_00000100]
                    ([NodeName]
                    ,[NodeID]
                    ,[ParentID]
                    ,[BwsrType]
                    ,[CrtDate]
                    ,[LastDate]
                    ,[CrtUser]
                    ,[LastUser]
                    ,[Owner]
                    ,[RecEnt]
                    ,[RecOU]
                    ,[RecID])
                VALUES
                    (@NodeName
                    ,@NewRecID
                    ,@ParentID
                    ,3
                    ,@CrtDate
                    ,@LastDate
                    ,@CrtUser
                    ,@LastUser
                    ,@Owner
                    ,@RecEnt
                    ,@RecOU
                    ,@NewRecID)
            FETCH NEXT FROM DuplicateFolderCursor into @NodeName,@NodeID,@ParentID,@BwsrType,@CrtDate,@LastDate,@CrtUser,@LastUser,@Owner,@RecEnt,@RecOU,@RecID
        END		
    CLOSE DuplicateFolderCursor
    DEALLOCATE DuplicateFolderCursor

--Step 3: Search NodeIDs that have quotationJobs and change BwsrID of that elements in DIS_MMNN_BWSR_00000200 table.
    DECLARE 
	    @Name			    nvarchar(255),
        @Node               int,
        @NodeUpdate         int

    DECLARE QuoteJobFolderCursor CURSOR FOR

    SELECT DIS_MMNN_BWSR_00000100.NodeID,DIS_MMNN_BWSR_00000100.NodeName
    from DIS_MMNN_BWSR_00000100,DIS_MMNN_BWSR_00000200,DIS_MMNN_MMOO_00000200
    where DIS_MMNN_BWSR_00000100.NodeID=DIS_MMNN_BWSR_00000200.BwsrID AND DIS_MMNN_BWSR_00000200.RecordID=DIS_MMNN_MMOO_00000200.RecID AND DIS_MMNN_MMOO_00000200.IsQuote=1 
    GROUP BY DIS_MMNN_BWSR_00000100.NodeID,DIS_MMNN_BWSR_00000100.NodeName

    OPEN QuoteJobFolderCursor
    FETCH NEXT FROM QuoteJobFolderCursor into @Node,@Name
	    WHILE @@FETCH_STATUS = 0
	    BEGIN	
		    SET @NodeUpdate = (select NewNode from #RecIdTableVar where (OldNode = @Node))
            update DIS_MMNN_BWSR_00000200 set BwsrID = @NodeUpdate	from DIS_MMNN_BWSR_00000200,DIS_MMNN_MMOO_00000200 where (BwsrID=@Node) and (DIS_MMNN_BWSR_00000200.RecordID = DIS_MMNN_MMOO_00000200.RecID) and (DIS_MMNN_MMOO_00000200.IsQuote=1)
		    FETCH NEXT FROM QuoteJobFolderCursor into @Node,@Name
	    END
    CLOSE QuoteJobFolderCursor
    DEALLOCATE QuoteJobFolderCursor


--Step 4: Delete all the empty folders including the parent folders. 
--This script inserts in a temporal table the nodeIDs that has any job and their parent nodes and then delete the nodes that are not in this table.
    DECLARE
    @Parent	int

    DECLARE @MyTableVar table(Node int NOT NULL); 

    Insert Into @MyTableVar (Node)
    select DIS_MMNN_BWSR_00000100.NodeID
    from DIS_MMNN_BWSR_00000100,DIS_MMNN_BWSR_00000200,DIS_MMNN_MMOO_00000200
    where DIS_MMNN_BWSR_00000100.NodeID=DIS_MMNN_BWSR_00000200.BwsrID AND DIS_MMNN_BWSR_00000200.RecordID=DIS_MMNN_MMOO_00000200.RecID group by DIS_MMNN_BWSR_00000100.NodeID


    SET @Parent= ISNULL((SELECT top 1 ParentID from DIS_MMNN_BWSR_00000100 where NodeID in (Select Node from @MyTableVar) and ParentID>1 and ParentID not in (Select Node from @MyTableVar)),0)

    WHILE @Parent!=0
    BEGIN
        Insert Into @MyTableVar (Node)
        SELECT ParentID from DIS_MMNN_BWSR_00000100 where NodeID in (Select Node from @MyTableVar) and ParentID>1 and ParentID not in (Select Node from @MyTableVar)
        SET @Parent= ISNULL((SELECT top 1 ParentID from DIS_MMNN_BWSR_00000100 where NodeID in (Select Node from @MyTableVar) and ParentID>1 and ParentID not in (Select Node from @MyTableVar)),0)
    END

    DELETE FROM [dbo].[DIS_MMNN_BWSR_00000100] WHERE NodeID not in (SELECT Node from @MyTableVar) and NodeID!=1 

    --Step 5: Update the configuration parameter JobFolderIdentifier.
	DECLARE
    @JobFolderIdentifier	int,
	@NewJobFolderIdentifier	int,
	@JobFolderBwsrType		int

	SET @JobFolderIdentifier = (SELECT ParValue FROM SYST_CCPP_00000100 WHERE (ParName = 'DIS_CRM_JobFolderIdentifier'))
	SET @JobFolderBwsrType = (SELECT BwsrType from DIS_MMNN_BWSR_00000100 where NodeID=@JobFolderIdentifier)
	

	If @JobFolderBwsrType=1
	BEGIN
		SET @NewJobFolderIdentifier = (SELECT NewNode from #RecIdTableVar where OldNode=@JobFolderIdentifier)
		update SYST_CCPP_00000100 set ParValue = @NewJobFolderIdentifier from SYST_CCPP_00000100 WHERE (ParName = 'DIS_CRM_JobFolderIdentifier')
	END

END