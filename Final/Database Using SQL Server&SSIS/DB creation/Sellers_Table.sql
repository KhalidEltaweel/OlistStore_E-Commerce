if exists ( select * 
			from sys.tables
			where name = 'Sellers'
			and 
			type= 'U')

drop table Sellers 

GO 

--Table Sellers 

create table Sellers 
			 ( seller_id varchar(300) primary key,
			   seller_zip_code_prefix int,
			   seller_city varchar(150),
			   seller_state varchar(20))