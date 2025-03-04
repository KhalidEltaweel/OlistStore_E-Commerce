if exists ( 
		   select * from
		   sys.foreign_keys
		   where name = 'FK_factsales_DimOrderReview'
		   and 
		   object_id= OBJECT_ID('OrderSalesFact'))

alter table FactOrderSales 
drop constraint FK_factsales_DimOrderReview


if exists (
		   select * from
		   sys.tables
		   where name = 'DimOrderReview'
		   and 
		   type = 'U')
drop table DimOrderReview

GO
-- create table Dim OrderReview
 create table DimOrderReview
			  ( order_review_sk			INT PRIMARY KEY IDENTITY,
			    review_id				NVARCHAR(50) NOT NULL,
				order_id				NVARCHAR(255) NOT NULL,
				review_score			FLOAT,
				review_comment_title	NVARCHAR(1000),
				review_comment_message	NVARCHAR(1000),
				review_creation_date	DATETIME,
				review_answer_timestamp DATETIME,
				start_date				DATE,
				end_date				DATE,
				is_current				INT)

