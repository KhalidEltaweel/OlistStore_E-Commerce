if exists ( select * 
			from sys.tables
			where name = 'Reviews'
			and 
			type= 'U')

drop table Reviews  

GO

create table Reviews 
			 (Review_id varchar(300) primary key,
			  Order_id varchar(300),
			  review_Score int,
			  review_Comment_title varchar(300),
			  review_Comment_Message varchar(1000),
			  review_Creation_Date datetime,
			  review_Answer_Timestamp datetime,
			  foreign key (Order_id) REFERENCES on Orders (Order_id) on delete cascade)