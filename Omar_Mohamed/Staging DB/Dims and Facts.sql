select * from ProductDIM
drop view ProductDIM

select * into ProductsDim
from Products

alter table productsDim
add start_date date, end_date date, IsCurrent int, 
SGproduct int primary key identity 

SELECT * INTO olist_staging.dbo.ProductsDIM
FROM olistSales.dbo.ProductsDim

-- customerDim
select * into CustomersDim
from Customers

alter table CustomersDim
add SG_Customer int primary key identity,
start_date date, end_date date, IsCurrent int 

SELECT * INTO olist_staging.dbo.CustomersDIM
FROM olistSales.dbo.CustomersDim

-- SellerDim

SELECT * INTO olist_staging.dbo.SellerDIM 
FROM olistSales.dbo.Sellers 

--orderReview dim
SELECT * INTO olist_staging.dbo.Order_reviewDIM
FROM olistSales.dbo.Order_reviewes




------ Creating order-fact 
select o.order_id,ot.product_id , ot.order_item_id, 
c.customer_id, s.seller_id,rv.review_id,o.order_approved_at,
o.order_purchase_timestamp, o.order_delivered_carrier_date,
o.order_delivered_customer_date,o.order_estimated_delivery_date,
ot.shipping_limit_date,o.order_status,
ot.price,ot.freight_value 
INTO olist_staging.dbo.OrdersFact
from Orders o left join Order_details ot
on o.order_id = ot.order_id
left join
Customers c 
on c.customer_id= o.customer_id
left join
Sellers s
on ot.seller_id= s.seller_id
left join
Order_reviewes rv
on rv.order_id=o.order_id



-- Validating Order fact table 
select ot.order_id,ot.product_id , ot.order_item_id, 
c.customer_id, s.seller_id,rv.review_id,o.order_approved_at,
o.order_purchase_timestamp, o.order_delivered_carrier_date,
o.order_delivered_customer_date,o.order_estimated_delivery_date,
ot.shipping_limit_date,o.order_status,
ot.price,ot.freight_value 
from Orders o left join Order_details ot
on o.order_id = ot.order_id
left join
Customers c 
on c.customer_id= o.customer_id
left join
Sellers s
on ot.seller_id= s.seller_id
left join
Order_reviewes rv
on rv.order_id=o.order_id


select order_id, product_id ,Count(product_id)
from Order_details
group by order_id, product_id
having count(product_id)>1



select * from Order_details
order by order_id

select * from Products
where product_category_name='esporte_lazer'

--Payment fact 
select o.order_id,p.payment_sequential,p.payment_installments,
p.payment_value, 
c.customer_id, o.order_approved_at,
o.order_status into olist_staging.dbo.OrderPaymentFact
from Orders o left join Payments p
on o.order_id= p.order_id 
left join
Customers c 
on c.customer_id= o.customer_id


-- cleaning payments table 
select distinct order_id, payment_sequential
from Payments

select count(*), order_id, payment_sequential
from Payments
group by order_id, payment_sequential
having COUNT(*) >1

select * from Payments
where order_id= 'b81ef226f3fe1789b1e8b2acac839d17'

update Payments
set payment_sequential= 2
where Payment_key = 13283

-- order review 
alter table order_reviewDIM
alter column review_id nvarchar(50) 

select * from OrderPaymentFact
where payment_sequential is null 

delete from OrderPaymentFact
where payment_sequential is null 