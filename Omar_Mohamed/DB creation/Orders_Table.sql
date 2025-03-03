if exists ( select * 
			from sys.tables
			where name = 'Orders'
			and 
			type= 'U')

drop table Orders   

GO 
-- orders table (each customer has a diffrent order ids)  
create table orders 
			( Order_id varchar(300) primary key,
			  Customer_id varchar(300),
			  Order_status varchar(90),
			  Order_purchase_Timestamp datetime,
			  Order_approved_at datetime,
			  order_delivered_carrier_date datetime,
			  order_delivered_customer_date datetime,
			  order_estimated_delivery_date datetime,
			  foreign key (Customer_id) references Customers(Customer_id))