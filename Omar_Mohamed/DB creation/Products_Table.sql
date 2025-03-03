if exists ( select * 
			from sys.tables
			where name = 'Products'
			and 
			type= 'U')

drop table Products 

GO

-- Table Products
create table Products
			 (ProductID varchar(300) primary key,
			  Product_CategoryName varchar(300),
			  Product_NameLength int,
			  Product_DescriptionLength int,
			  Product_PhotosQunt int,
			  ProductWeight_Gm int,
			  Product_Length_CM int,
			  Product_height_CM int,
			  Product_Width_CM int)
