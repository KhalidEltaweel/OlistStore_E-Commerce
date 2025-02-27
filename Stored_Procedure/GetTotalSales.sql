USE [olistSales]
GO

/****** Object:  StoredProcedure [dbo].[GetTotalSales]    Script Date: 2/28/2025 12:58:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTotalSales]
AS
BEGIN
    SELECT SUM(payment_value) AS TotalSales
    FROM Payments;
END;
GO


