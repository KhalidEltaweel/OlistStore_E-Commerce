USE [olistSales]
GO

CREATE PROCEDURE [dbo].[UpdateOrder_]
    @order_id NVARCHAR(255),
    @order_status NVARCHAR(255) = NULL,
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
        -- Update the order in the Orders table
        UPDATE [dbo].[Orders]
        SET 
            order_status = ISNULL(@order_status, order_status),
            order_approved_at = ISNULL(@order_approved_at, order_approved_at),
            order_delivered_carrier_date = ISNULL(@order_delivered_carrier_date, order_delivered_carrier_date),
            order_delivered_customer_date = ISNULL(@order_delivered_customer_date, order_delivered_customer_date),
            order_estimated_delivery_date = ISNULL(@order_estimated_delivery_date, order_estimated_delivery_date)
        WHERE 
            order_id = @order_id;

        -- Check if any rows were updated
        IF @@ROWCOUNT = 0
        BEGIN
            SELECT 'No order found with the specified ID.' AS Result;
        END
        ELSE
        BEGIN
            SELECT 'Order updated successfully.' AS Result;
        END
    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage,
            'Failed to update order.' AS Result;
    END CATCH;
END
GO


EXEC [dbo].[UpdateOrder_]
    @order_id = 'ORDER12345',
    @order_status = 'delivered',
    @order_delivered_customer_date = '2025-03-15 14:30:00';