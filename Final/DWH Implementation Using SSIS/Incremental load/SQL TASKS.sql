--Staging Area
USE olist_staging

--adding modified date to fact tables to apply increamental load
alter table OrderSalesFact
add ModifiedDate datetime

alter table OrderPaymentFact
add ModifiedDate datetime

-- creating trigger (Tdate) after insert to update modified date coulmn

create trigger Tdat on OrderSalesFact after insert as 
begin 
update OrderSalesFact 
set ModifiedDate = GETDATE()
    FROM OrderSalesFact 
    INNER JOIN INSERTED 
    ON OrderSalesFact.order_id = INSERTED.order_id
end

-- creating trigger (Tdate_t) after insert to update modified date coulmn

create trigger Tdat_t on OrderPaymentFact after insert as 
begin 
update OrderPaymentFact 
set ModifiedDate = GETDATE()
    FROM OrderPaymentFact 
    INNER JOIN INSERTED 
    ON OrderPaymentFact.order_id = INSERTED.order_id
end



-- check trigger

insert into OrderSalesFact
(order_id)
values (010022336478), (1012021867), (125588), (5696787)

select * from OrderSalesFact
where order_id = (select top 1 order_id from OrderSalesFact
order by ModifiedDate desc)

update OrderSalesFact
set order_approved_at = '2022-07-21 16:32:18.027'
where order_id = '10022336478'

insert into OrderSalesFact
(order_approved_at, customer_id , price, review_id)
values(getdate(),845,3,18)

delete from OrderSalesFact
where order_id = '10022336478'

--creating trigger TUdate on update the modifieddate column 

create trigger TUdate on OrderSalesFact after update as 
begin 
update OrderSalesFact
set ModifiedDate = GETDATE()
FROM OrderSalesFact 
    INNER JOIN INSERTED 
    ON OrderSalesFact.order_id = INSERTED.order_id 
end

--creating trigger TUdate_t on update the modifieddate column 

create trigger TUdate_t on OrderPaymentFact after update as 
begin 
update OrderPaymentFact
set ModifiedDate = GETDATE()
FROM OrderPaymentFact 
    INNER JOIN INSERTED 
    ON OrderPaymentFact.order_id = INSERTED.order_id 
end




--DWH 

USE OlistStore_DWH
create table MetaData 
(ID int, Name varchar(20), date datetime) 

insert into MetaData values (1, 'First', '1900-1-1') 

select date from MetaData where Name = 'First'

select * from MetaData
select date from MetaData where Name = 'First'

truncate table Factsales 

select * from FactOrderSales
where order_id in  ('10022336478', '1012021867', '125588', '5696787')

delete from FactOrderSales
where order_id in  ('10022336478', '1012021867', '125588', '5696787')

select * from MetaData