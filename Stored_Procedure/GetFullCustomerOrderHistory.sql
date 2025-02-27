USE [olistSales]
GO

/****** Object:  StoredProcedure [dbo].[GetFullCustomerOrderHistory]    Script Date: 2/28/2025 12:57:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFullCustomerOrderHistory]
    @CustomerID VARCHAR(50) -- Change data type to match your schema
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        o.order_id,
        o.order_purchase_timestamp,
        o.order_status,
        od.product_id,
        p.product_category_name,
        od.order_item_id,
        od.price,
        od.freight_value,
        py.payment_type,
        py.payment_value
    FROM Orders o
    INNER JOIN Order_details od ON o.order_id = od.order_id
    INNER JOIN Products p ON od.product_id = p.product_id
    LEFT JOIN Payments py ON o.order_id = py.order_id
    WHERE o.customer_id = @CustomerID
    ORDER BY o.order_purchase_timestamp DESC;
END;
GO


