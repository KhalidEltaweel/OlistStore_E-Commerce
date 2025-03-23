if exists ( select * 
			from sys.tables
			where name = 'Orders_Items'
			and 
			type= 'U')

drop table Orders_Items  

GO

create table Order_Items 
			(order_id varchar(300),
			 order_item_id int,
			 Product_Id varchar(300),
			 Seller_Id varchar(300),
			 shipping_limit_date datetime,
			 Price decimal(10,2),
			 Freight_Value decimal(10,2),
			 foreign key (Product_ID) REFERENCES products (ProductID),
			 foreign key (order_id) REFERENCES orders (order_id),
			 foreign key (Seller_Id) REFERENCES Sellers (Seller_Id))
 