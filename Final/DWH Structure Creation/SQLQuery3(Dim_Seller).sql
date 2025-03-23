if exists ( 
		   select * from
		   sys.foreign_keys
		   where name = 'FK_FactOrderSales_DimSeller'
		   and 
		   object_id= OBJECT_ID('FactOrderSales'))

alter table FactOrderSales 
drop constraint FK_FactOrderSales_DimSeller


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
			  ( seller_sk					int primary key identity,
			    seller_id					nvarchar(255) not null,
				seller_zip_code_prefix		float,
				seller_city					nvarchar(255),
				seller_state				nvarchar(50),
				start_date					datetime not null,
				end_date					datetime,
				is_current					int)

--constraints	
	
alter table DimSeller
add constraint DF_DimSeller_start_date
default getdate() for start_date

alter table DimSeller
add constraint DF_DimSeller_is_current
default 1 for is_current