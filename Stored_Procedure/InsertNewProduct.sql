USE [olistSales]
GO

CREATE PROCEDURE [dbo].[InsertNewProduct]
    @product_id NVARCHAR(255),
    @product_category_name NVARCHAR(255) = NULL,
    @product_name_lenght FLOAT = NULL,
    @product_description_lenght FLOAT = NULL,
    @product_photos_qty FLOAT = NULL,
    @product_weight_g FLOAT = NULL,
    @product_length_cm FLOAT = NULL,
    @product_height_cm FLOAT = NULL,
    @product_width_cm FLOAT = NULL
AS
BEGIN
    -- SET NOCOUNT ON to prevent extra result sets
    SET NOCOUNT ON;

    -- Insert new product into the Products table
    INSERT INTO [dbo].[Products] (
        product_id,
        product_category_name,
        product_name_lenght,
        product_description_lenght,
        product_photos_qty,
        product_weight_g,
        product_length_cm,
        product_height_cm,
        product_width_cm
    )
    VALUES (
        @product_id,
        @product_category_name,
        @product_name_lenght,
        @product_description_lenght,
        @product_photos_qty,
        @product_weight_g,
        @product_length_cm,
        @product_height_cm,
        @product_width_cm
    );
END
GO


select * from Products
EXEC [dbo].[InsertNewProduct]
    @product_id = '00066f42aeeb9f3007568bb9d3f33c38',
    @product_category_name = 'category_name',
    @product_name_lenght = 50,
    @product_description_lenght = 200,
    @product_photos_qty = 3,
    @product_weight_g = 500,
    @product_length_cm = 30,
    @product_height_cm = 20,
    @product_width_cm = 15;