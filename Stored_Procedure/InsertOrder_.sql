USE [olistSales]
GO

CREATE PROCEDURE [dbo].[InsertOrder_]
    @order_id NVARCHAR(255),
    @customer_id NVARCHAR(255),
    @order_status NVARCHAR(255),
    @order_approved_at DATETIME = NULL,
    @order_delivered_carrier_date DATETIME = NULL,
    @order_delivered_customer_date DATETIME = NULL,
    @order_estimated_delivery_date DATETIME = NULL
AS
BEGIN
    -- SET NOCOUNT ON to prevent extra result sets
    SET NOCOUNT ON;

    -- Begin error handling
    BEGIN TRY
        -- Insert the new order into the Orders table
        INSERT INTO [dbo].[Orders] (
            order_id,
            customer_id,
            order_status,
            order_approved_at,
            order_delivered_carrier_date,
            order_delivered_customer_date,
            order_estimated_delivery_date
        )
        VALUES (
            @order_id,
            @customer_id,
            @order_status,
            @order_approved_at,
            @order_delivered_carrier_date,
            @order_delivered_customer_date,
            @order_estimated_delivery_date
        );

        -- Return success message
        SELECT 'Order inserted successfully.' AS Result;
    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage,
            'Failed to insert order.' AS Result;
    END CATCH;
END
GO


EXEC [dbo].[InsertOrder_]
    @order_id = 'ORDER12345',
    @customer_id = 'CUST67890',
    @order_status = 'pending',
    @order_approved_at = '2025-03-01 10:00:00',
    @order_delivered_carrier_date = NULL,
    @order_delivered_customer_date = NULL,
    @order_estimated_delivery_date = '2025-03-10';