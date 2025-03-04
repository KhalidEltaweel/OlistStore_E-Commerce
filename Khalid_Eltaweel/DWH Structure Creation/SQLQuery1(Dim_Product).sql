if exists ( 
		   select * from
		   sys.foreign_keys
		   where name = 'FK_factsales_DimProduct'
		   and 
		   object_id= OBJECT_ID('OrderSalesFact'))

alter table FactOrderSales 
drop constraint FK_factsales_DimProduct


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
			  ( product_sk int primary key identity,
			    product_id NVARCHAR(255) NOT NULL,
				product_category_name NVARCHAR(255),
				product_name_lenght float,
				product_description_lenght float,
				product_photos_qty	float,
				product_weight_g	float,
				product_length_cm	float,
				product_height_cm	float,
				product_width_cm	float,
				start_date			datetime NOT NULL,
				end_date			datetime,
				is_current			int)
