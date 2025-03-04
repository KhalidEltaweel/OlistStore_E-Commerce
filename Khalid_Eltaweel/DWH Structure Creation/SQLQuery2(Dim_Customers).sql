if exists ( 
		   select * from
		   sys.foreign_keys
		   where name = 'FK_factsales_DimCustomer'
		   and 
		   object_id= OBJECT_ID('OrderSalesFact'))

alter table FactOrderSales 
drop constraint FK_factsales_DimCustomers


if exists (
		   select * from
		   sys.tables
		   where name = 'DimCustomer'
		   and 
		   type = 'U')
drop table DimCustomer

GO
-- create table Dim Customer
 create table DimCustomer
			  ( customer_sk int primary key identity,
			    customer_id NVARCHAR(255) NOT NULL,
				customer_unique_id NVARCHAR(255),
				customer_zip_code_prefix float,
				customer_city		NVARCHAR(255),
				customer_state		NVARCHAR(255),
				start_date			date,
				end_date			date,
				is_current			int)
