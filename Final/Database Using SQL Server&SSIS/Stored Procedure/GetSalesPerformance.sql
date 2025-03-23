CREATE PROCEDURE GetSalesPerformance
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CONVERT(VARCHAR(7), o.order_purchase_timestamp, 23) AS sales_month, 
        COUNT(DISTINCT o.order_id) AS total_orders,
        CEILING(SUM(od.price + od.freight_value)) AS total_revenue,
        CEILING(AVG(od.price + od.freight_value)) AS avg_order_value
    FROM Orders o
    JOIN Order_details od ON o.order_id = od.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY CONVERT(VARCHAR(7), o.order_purchase_timestamp, 23)
    ORDER BY sales_month;
END;


