CREATE TABLE FactOrderSales
  (
     order_sales_sk							INT Primary key identity,	-- surrogate key as a primary key
	 order_id								NVARCHAR(255),				-- degenerate dimension
	 order_item_id							FLOAT,						-- degenerate dimension
	 product_sk								INT,						-- surrogate key as a forigen key
	 customer_sk							INT,						-- surrogate key as a forigen key
	 seller_sk								INT,						-- surrogate key as a forigen key
     order_review_sk						INT,						-- surrogate key as a forigen key
     date_sk								INT,						-- surrogate key as a forigen key
	 order_approved_at						INT,						-- surrogate key as a forigen key
	 order_purchase_date_fk					INT,						-- surrogate key as a forigen key
	 order_delivered_carrier_date_fk		INT,						-- surrogate key as a forigen key
	 order_delivered_customer_date_fk		INT,						-- surrogate key as a forigen key
	 order_estimated_delivery_date_fk		INT,						-- surrogate key as a forigen key
	 shipping_limit_date_fk					INT,						-- surrogate key as a forigen key
	 purchase_time							time(0),
	 order_approved_at_time					time(0),
	 order_delivered_carrier_time			time(0),
	 order_delivered_customer_time			time(0),
	 order_status							NVARCHAR(255),				-- degenerate dimension


	 price				FLOAT,							-- Measure
     freight_value		FLOAT,							-- Measure
     total_price		FLOAT);							-- Measure




--contraints 

 alter table FactOrderSales
 add constraint FK_FactOrderSales_DimCustomer foreign key (customer_sk)
 references DimCustomer (customer_sk)

 alter table FactOrderSales			  
 add constraint FK_FactOrderSales_DimDate foreign key (order_approved_at_fk)
 references DimDate (DateSK)

 alter table FactOrderSales			  
 add constraint FK_FactOrderSales_DimDate1 foreign key (order_purchase_date_fk)
 references DimDate (DateSK)	
 
 alter table FactOrderSales			  
 add constraint FK_FactOrderSales_DimDate2 foreign key (order_delivered_carrier_date_fk)
 references DimDate (DateSK)		

 alter table FactOrderSales			  
 add constraint FK_FactOrderSales_DimDate3 foreign key (order_delivered_customer_date_fk)
 references DimDate (DateSK)	
 
 alter table FactOrderSales			  
 add constraint FK_FactOrderSales_DimDate4 foreign key (order_estimated_delivery_date_fk)
 references DimDate (DateSK)	
 
 alter table FactOrderSales			  
 add constraint FK_FactOrderSales_DimDate5 foreign key (shipping_limit_date_fk)
 references DimDate (DateSK)	

 alter table FactOrderSales			  
 add constraint FK_FactOrderSales_DimDate6 foreign key (date_sk)
 references DimDate (DateSK)	

 alter table FactOrderSales			  
 add constraint FK_FactOrderSales_DimOrderReview foreign key (order_review_sk)
 references DimOrderReview (order_review_sk)	

 alter table FactOrderSales			  
 add constraint FK_FactOrderSales_DimProduct foreign key (product_sk)
 references DimProduct (product_sk)	

 alter table FactOrderSales			  
 add constraint FK_FactOrderSales_DimSeller foreign key (seller_sk)
 references DimSeller (seller_sk)	

