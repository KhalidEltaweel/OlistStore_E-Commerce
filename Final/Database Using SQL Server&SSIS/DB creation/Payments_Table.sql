create database OlistDB 
use OlistDB 

if exists ( select * 
			from sys.tables
			where name = 'Payments'
			and 
			type= 'U')

drop table Payments 

GO

--Table Payment
create table Payemnts 
			( Order_id varchar(300),
			  PaymentSequential int,
			  PaymentType varchar(200),
			  PaymentValue decimal(10,2),
			  PaymentInstallment int,
			  foreign key (Order_id) REFERENCES on orders (Order_id) )