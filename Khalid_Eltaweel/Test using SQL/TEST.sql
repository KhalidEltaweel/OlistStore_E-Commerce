
USE OlistStore

33450649f41ed254714b462ecdb050cd
33481c8e76159f5a3318911105d58475
3348fa7940562350a8d19cf788f0187b
3349d5fc8a511315de279fcce11049f6

SELECT *
FROM Payments
where order_id = '00018f77f2f0320c557190d7a144bdd3'

SELECT customer_unique_id, count(*)
from Customers
group by customer_unique_id
having count(*) > 1

SELECT *
FROM Orders
where customer_id = '216360d7df0e08d493f369b39a5fb69a'

SELECT *
FROM olist_staging.dbo.FactOrderSales
where customer_id = '216360d7df0e08d493f369b39a5fb69a'



SELECT o.order_id, os.order_item_id,
p.product_id, c.customer_id, s.seller_id,
o.order_approved_at, o.order_delivered_carrier_date, o.order_delivered_customer_date,
o.order_estimated_delivery_date, o.order_purchase_timestamp, os.shipping_limit_date,

FROM Orders o LEFT JOIN Order_details os 
ON o.order_id = os.order_id
LEFT JOIN Products P
ON p.product_id = os.product_id
LEFT JOIN Customers C
ON  c.customer_id = o.customer_id
LEFT JOIN Sellers s
ON  s.seller_id = os.seller_id
LEFT JOIN Order_reviewes ore
ON o.order_id = ore.order_id

where os.order_item_id is null

select *
from olist_staging.dbo.FactOrderSales
where order_item_id is null

USE olist_staging

select *, 
CAST(order_approved_at AS TIME(0)) AS order_approved_at_time,
CAST(order_purchase_timestamp AS TIME(0)) AS purchase_time, 
CAST(order_delivered_carrier_date AS TIME(0)) AS order_delivered_carrier_time,
CAST(order_delivered_customer_d
ate AS TIME(0)) AS order_delivered_customer_time into NewFactOrderSales
from FactOrderSales


select *, CAST(order_approved_at AS nvarchar(255)) AS date_id 
into OrderPaymentFact
from z_OrderPaymentFact

select o.*, os.payment_type into OrderPaymentFact
from z_OrderPaymentFact_n o inner join OlistStore.dbo.Payments os
on o.order_id = os.order_id and o.payment_sequential = os.payment_sequential

update OrderPaymentFact
set payment_type_id = 1
where payment_type = 'credit_card'

update OrderPaymentFact
set payment_type_id = 2
where payment_type = 'not_defined'

update OrderPaymentFact
set payment_type_id = 3
where payment_type = 'debit_card'

update OrderPaymentFact
set payment_type_id = 4
where payment_type = 'boleto'

update OrderPaymentFact
set payment_type_id = 5
where payment_type = 'voucher'


select *
from z_OrderPaymentFact_n
where order_id = '009ac365164f8e06f59d18a08045f6c4'

select *
from OrderPaymentFact
where order_id = '009ac365164f8e06f59d18a08045f6c4'

-- formatting date key

ALTER TABLE OrderPaymentFact
ADD formatted_date nvarchar(255);


UPDATE OrderPaymentFact
SET formatted_date = CONVERT(nvarchar(255), date_id, 112);



--dwh
USE OlistStore_DWH
SELECT *
FROM FactOrderSales

SELECT *
FROM FactOrderPayment

