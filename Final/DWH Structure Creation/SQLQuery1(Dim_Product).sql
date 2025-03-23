if exists ( 
		   select * from
		   sys.foreign_keys
		   where name = 'FK_FactOrderSales_DimProduct'
		   and 
		   object_id= OBJECT_ID('FactOrderSales'))

alter table FactOrderSales 
drop constraint FK_FactOrderSales_DimProduct


if exists (
		   select * from
		   sys.tables
		   where name = 'DimProduct'
		   and 
		   type = 'U')
drop table DimProduct

GO
-- create table Dim Product
 create table DimProduct
			  ( product_sk					int primary key identity,
			    product_id					nvarchar(255) not null,
				product_category_name		nvarchar(255),
				product_name_lenght			float,
				product_description_lenght	float,
				product_photos_qty			float,
				product_weight_g			float,
				product_length_cm			float,
				product_height_cm			float,
				product_width_cm			float,
				start_date					datetime not null,
				end_date					datetime,
				is_current					int)
	
--constraints	
	
alter table DimProduct
add constraint DF_DimProduct_start_date
default getdate() for start_date

alter table DimProduct
add constraint DF_DimProduct_is_current
default 1 for is_current