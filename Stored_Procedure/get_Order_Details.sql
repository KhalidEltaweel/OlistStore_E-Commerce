USE [olistSales]
GO

CREATE PROCEDURE [dbo].[GetSellerRevenue]
    @seller_id NVARCHAR(255)
AS
BEGIN
    -- SET NOCOUNT ON to prevent extra result sets
    SET NOCOUNT ON;

    -- Calculate total revenue for the seller
    SELECT 
        s.seller_id,
        s.seller_city,
        s.seller_state,
        SUM(od.price + od.freight_value) AS total_revenue
    FROM 
        [dbo].[Sellers] s
    INNER JOIN 
        [dbo].[Order_details] od ON s.seller_id = od.seller_id
    WHERE 
        s.seller_id = @seller_id
    GROUP BY 
        s.seller_id, s.seller_city, s.seller_state;
END
GO

select * from Sellers
EXEC [dbo].[GetSellerRevenue] @seller_id = '0015a82c2db000af6aaaf3ae2ecb0532';