if exists ( select * 
			from sys.tables
			where name = 'Customers'
			and 
			type= 'U')

drop table Customers  

GO 

create table Customers 
			(customer_id varchar(300) primary key,
			 customer_unique_id varchar(300),
			 customer_zip_code_prefix int,
			 customer_city varchar(150),
			 customer_state varchar(20))
