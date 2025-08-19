
-- Remove HHRR module from the DBFlags field-

declare

@dbflags nvarchar(4000),
@originalModules nvarchar(4000),
@modules nvarchar(4000),
@constStartModules nvarchar(4000),
@constEndModules nvarchar(4000),
@startPosition int,
@endPosition int

set @constStartModules = 'Modules="'
set @constEndModules = '"'

set @dbflags = (select dbflags from SYST_SYST_00000100)
set @startPosition = charindex(@constStartModules, @dbflags)
set @originalModules = SUBSTRING(@dbflags, @startPosition + len(@constStartModules), len(@dbflags))
set @endPosition = charindex(@constEndModules, @originalModules)
set @originalModules = SUBSTRING(@originalModules, 0, @endPosition)

set @modules = REPLACE(@originalModules, 'RRHH,', '')
set @modules = REPLACE(@modules, 'RRHH', '')

set @dbflags = REPLACE(@dbflags, @originalModules, @modules)

update SYST_SYST_00000100 set DBFlags = @dbflags