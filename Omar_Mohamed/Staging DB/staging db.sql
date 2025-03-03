create database olist_staging 

alter table sellerDIM 
add SG_Seller int primary key identity,
start_date date, end_date date, IsCurrent int

alter table Order_reviewDIM
add SG_Order_reviewDIM int primary key identity,
start_date date, end_date date, IsCurrent int

--Payment dim
create table Payment_DIM(
 Payment_SG int primary key identity, payment_Type varchar(100)) 
 


