if exists ( 
		   select * from
		   sys.foreign_keys
		   where name = 'FK_FactOrderPayment_DimPaymentType'
		   and 
		   object_id= OBJECT_ID('FactOrderPayment'))

alter table FactOrderPayment 
drop constraint FK_FactOrderPayment_DimPaymentType


if exists (
		   select * from
		   sys.tables
		   where name = 'DimPaymentType'
		   and 
		   type = 'U')
drop table DimOrderReview

GO
-- create table Dim PaymentType

 create table DimPaymentType
			  ( payment_sk				int primary key identity,
				payment_type			nvarchar(50))

