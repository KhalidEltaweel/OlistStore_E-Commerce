if exists ( 
		   select * from
		   sys.foreign_keys
		   where name = 'FK_factsales_DimPaymentType'
		   and 
		   object_id= OBJECT_ID('OrderSalesFact'))

alter table FactOrderSales 
drop constraint FK_factsales_DimPaymentType


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
			  ( payment_sk			INT PRIMARY KEY IDENTITY,
				payment_type			NVARCHAR(50))

INSERT INTO DimPaymentType (payment_type)
SELECT payment_Type
FROM olist_staging.dbo.Payment_DIM