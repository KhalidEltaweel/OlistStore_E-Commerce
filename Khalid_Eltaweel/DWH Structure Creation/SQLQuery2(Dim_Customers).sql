-- check FactOrderSales

if exists ( 
		   select * from
		   sys.foreign_keys
		   where name = 'FK_FactOrderSales_DimCustomer'
		   and 
		   object_id= OBJECT_ID('FactOrderSales'))

alter table FactOrderSales 
drop constraint FK_FactOrderSales_DimCustomer


if exists (
		   select * from
		   sys.tables
		   where name = 'DimCustomer'
		   and 
		   type = 'U')
drop table DimCustomer

-- check FactOrderPayment

if exists ( 
		   select * from
		   sys.foreign_keys
		   where name = 'FK_FactOrderPayment_DimCustomer'
		   and 
		   object_id= OBJECT_ID('FactOrderPayment'))

alter table FactOrderPayment 
drop constraint FK_FactOrderPayment_DimCustomer

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
			  ( customer_sk					int primary key identity,
			    customer_id					nvarchar(255) not null,
				customer_unique_id			nvarchar(255),
				customer_zip_code_prefix	float,
				customer_city				nvarchar(255),
				customer_state				nvarchar(255),
				start_date					datetime not null,
				end_date					datetime,
				is_current					int)

--constraints	
	
alter table DimCustomer
add constraint DF_DimCustomer_start_date
default getdate() for start_date

alter table DimCustomer
add constraint DF_DimCustomer_is_current
default 1 for is_current