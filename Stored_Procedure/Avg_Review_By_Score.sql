USE [olistSales]
GO

/****** Object:  StoredProcedure [dbo].[GetAvgReviewScoreByProduct]    Script Date: 2/28/2025 12:55:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAvgReviewScoreByProduct]
AS
BEGIN
    SELECT p.product_id, p.product_category_name, 
           AVG(orw.review_score) AS AvgReviewScore
    FROM olistSales.dbo.Order_reviewes  orw
    JOIN Orders o ON orw.order_id = o.order_id
    JOIN olistSales.dbo.Order_details od ON o.order_id = od.order_id
    JOIN Products p ON od.product_id = p.product_id
    GROUP BY p.product_id, p.product_category_name
    ORDER BY AvgReviewScore DESC;
END;
GO


