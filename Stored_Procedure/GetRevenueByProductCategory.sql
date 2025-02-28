USE [olistSales]
GO

CREATE PROCEDURE [dbo].[GetRevenueByProductCategory]
    @product_category_name NVARCHAR(255)
AS
BEGIN
    -- SET NOCOUNT ON to prevent extra result sets
    SET NOCOUNT ON;

    -- Calculate total revenue for the specified product category
    SELECT 
        p.product_category_name,
        SUM(od.price + od.freight_value) AS total_revenue
    FROM 
        [dbo].[Order_details] od
    INNER JOIN 
        [dbo].[Products] p ON od.product_id = p.product_id
    WHERE 
        p.product_category_name = @product_category_name
    GROUP BY 
        p.product_category_name;
END
GO


EXEC [dbo].[GetRevenueByProductCategory] @product_category_name = 'esporte_lazer';



select * from Products