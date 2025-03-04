if exists ( 
		   select * from
		   sys.foreign_keys
		   where name = 'FK_factsales_DimSeller'
		   and 
		   object_id= OBJECT_ID('OrderSalesFact'))

alter table FactOrderSales 
drop constraint FK_factsales_DimSeller


if exists (
		   select * from
		   sys.tables
		   where name = 'DimSeller'
		   and 
		   type = 'U')
drop table DimSeller

GO
-- create table Dim Seller
 create table DimSeller
			  ( seller_sk int primary key identity,
			    customer_id NVARCHAR(255) NOT NULL,
				seller_zip_code_prefix float,
				seller_city			NVARCHAR(255),
				seller_state		NVARCHAR(50),
				start_date			date,
				end_date			date,
				is_current			int)

