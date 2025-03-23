if exists ( 
		   select * from
		   sys.foreign_keys
		   where name = 'FK_FactOrderSales_DimOrderReview'
		   and 
		   object_id= OBJECT_ID('FactOrderSales'))

alter table FactOrderSales 
drop constraint FK_FactOrderSales_DimOrderReview


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
			  ( order_review_sk				int primary key identity,
			    review_id					nvarchar(50) not null,
				review_score				float,
				review_comment_title		nvarchar(1000),
				review_comment_message		nvarchar(1000),
				review_creation_date		datetime,
				review_answer_timestamp		datetime,
				start_date					datetime not null,
				end_date					datetime,
				is_current					int)


--constraints	
	
alter table DimOrderReview
add constraint DF_DimOrderReview_start_date
default getdate() for start_date

alter table DimOrderReview
add constraint DF_DimOrderReview_is_current
default 1 for is_current