update SSHH_PPOO_00000200 set DlvStatus = 20 where Quantity <= RcvdQuantity and DlvStatus = 10
update SSHH_PPOO_00000200 set DlvStatus = 10 where Quantity > RcvdQuantity and DlvStatus = 20