CREATE TABLE FactOrderPayment
  (
     order_sales_sk   INT Primary key identity,			-- surrogate key as a primary key
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


 constraint FK_factsales_DimCustomer foreign key (customer_sk)
 references DimShipping (customer_sk),
			  
 constraint FK_factsales_DimDate foreign key (Date_SK)
 references DimDate (DateSK),
			  
 constraint FK_factsales_DimPaymentType foreign key (payment_type_sk)
 references DimPaymentType (payment_type_sk)
