CREATE TABLE FactOrderPayment
  (
     order_sales_sk			INT Primary key identity,	-- surrogate key as a primary key
	 order_id				NVARCHAR(255),				-- degenerate dimension
	 payment_sequential		FLOAT,						-- degenerate dimension
	 customer_sk			INT,						-- surrogate key as a forigen key
	 payment_type_sk		INT,						-- surrogate key as a forigen key
     date_sk				INT,						-- surrogate key as a forigen key
	 order_approved_at_fk	INT,						-- surrogate key as a forigen key (temporary as there is no payment date)
	 order_status			NVARCHAR(50),               -- degenerate dimension
	 
	 payment_installments	FLOAT,						-- Measure
	 payment_value			FLOAT,						-- Measure
  );





--contraints 

 alter table FactOrderPayment
 add constraint FK_FactOrderPayment_DimCustomer foreign key (customer_sk)
 references DimCustomer (customer_sk)

 alter table FactOrderPayment			  
 add constraint FK_FactOrderSales_DimDate foreign key (date_sk)
 references DimDate (DateSK)

 alter table FactOrderPayment			  
 add constraint FK_FactOrderSales_DimDate1 foreign key (order_approved_at_fk)
 references DimDate (DateSK)	
 	
 alter table FactOrderPayment			  
 add constraint FK_FactOrderPayment_DimPaymentType foreign key (payment_type_sk)
 references DimPaymentType (payment_type_sk)	