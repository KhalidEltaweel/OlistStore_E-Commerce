USE [olistSales]
GO

/****** Object:  StoredProcedure [dbo].[GetCustomerDistribution]    Script Date: 2/28/2025 12:56:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCustomerDistribution]
AS
BEGIN
    SELECT customer_state, COUNT(customer_id) AS TotalCustomers
    FROM Customers
    GROUP BY customer_state;
END;
GO


