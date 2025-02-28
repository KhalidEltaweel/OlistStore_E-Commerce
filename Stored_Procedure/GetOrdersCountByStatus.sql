USE [olistSales]
GO

/****** Object:  StoredProcedure [dbo].[GetOrdersCountByStatus]    Script Date: 2/28/2025 12:58:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOrdersCountByStatus]
AS
BEGIN
    SELECT order_status, COUNT(order_id) AS OrderCount
    FROM Orders
    GROUP BY order_status;
END;
GO


