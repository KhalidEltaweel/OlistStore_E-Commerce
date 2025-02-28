USE [olistSales]
GO

/****** Object:  StoredProcedure [dbo].[GetTopSellingProducts]    Script Date: 2/28/2025 12:58:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTopSellingProducts]
AS
BEGIN
    SELECT TOP 5 p.product_id, p.product_category_name, 
           COUNT(od.order_item_id) AS TotalSold
    FROM Order_details od
    JOIN Products p ON od.product_id = p.product_id
    GROUP BY p.product_id, p.product_category_name
    ORDER BY TotalSold DESC;
END;
GO


