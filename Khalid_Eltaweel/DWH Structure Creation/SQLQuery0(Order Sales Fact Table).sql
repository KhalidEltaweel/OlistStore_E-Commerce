CREATE TABLE FactOrderSales
  (
     order_sales_sk   INT Primary key identity,			-- surrogate key as a primary key
	 order_id				NVARCHAR(255),				-- degenerate dimension
	 order_item_id			FLOAT,						-- degenerate dimension
	 product_sk				INT,						-- surrogate key as a forigen key
	 customer_sk			INT,						-- surrogate key as a forigen key
	 seller_sk				INT,						-- surrogate key as a forigen key
     order_review_sk		INT,						-- surrogate key as a forigen key
     date_sk				INT,						-- surrogate key as a forigen key
	 order_approved_at		INT,						-- surrogate key as a forigen key
	 order_purchase_timestamp INT,						-- surrogate key as a forigen key
	 order_delivered_carrier_date INT,					-- surrogate key as a forigen key
	 order_delivered_customer_date INT,					-- surrogate key as a forigen key
	 order_estimated_delivery_date INT,					-- surrogate key as a forigen key
	 shipping_limit_date INT,							-- surrogate key as a forigen key
	 order_status			NVARCHAR(50),               -- degenerate dimension

	 price     FLOAT,									-- Measure
     freight_value    FLOAT,					        -- Measure
     total_price   FLOAT,								-- Measure


 constraint FK_factsales_DimCustomer foreign key (customer_sk)
 references DimCustomer (customer_sk),
			  
 constraint FK_factsales_DimDate foreign key (Date_SK)
 references DimDate (DateSK),
			  
 constraint FK_factsales_DimProduct foreign key(product_sk)
 references DimProduct (product_sk),
			  
constraint FK_factsales_DimOrderReview foreign key(order_review_sk)
references DimOrderReview (order_review_sk),

constraint FK_factsales_DimSeller foreign key(seller_sk)
references DimSeller (seller_sk)
);
