# Olist-E-Commerce Project
Olist-E-Commerce is a graduation project developed as part of the Power BI Development Track. The main objective of this project was to build a data warehouse and perform data analysis on a publicly available dataset. The dataset represents a Brazilian e-commerce business, and through this project, we aimed to uncover valuable insights. 

# Summary
In this project, we:

1- Created an ERD (Entity-Relationship Diagram): We started by analyzing the data structure and visualizing relationships.

2- Built a Database: We used the Olist dataset from Kaggle to set up the database.

3- Constructed a Data Warehouse: The data warehouse was designed using a galaxy schema to facilitate analytics and reporting.

4- ETL Process: We implemented an Extract, Transform, Load (ETL) process using Microsoft SQL Server Integration Services (SSIS).

5- OLAP Server: We built an OLAP (Online Analytical Processing) server using Microsoft SQL Server Analysis Services (SSAS).

6- Data Analysis and Visualization: We extracted insights using Microsoft Power BI, Tableau, and Excel, with paginated reports created in SQL Server Reporting Services (SSRS).

7- Data Mining: We used Python for deeper data analysis and mining.

# About the Company
Olist is an e-commerce company headquartered in Sao Paulo, Brazil. The company connects small businesses to customers across multiple online marketplaces, acting as a single point of contact for sales and logistics.

# About the Dataset

The dataset used in this project is publicly available and includes over 100,000 orders placed from 2016 to 2018 across various Brazilian marketplaces. You can access it on [Olist Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/data).

Brazilian E-Commerce Public Dataset by Olist

This is a Brazilian ecommerce public dataset of orders made at Olist Store. The dataset has information of 100k orders from 2016 to 2018 made at multiple marketplaces in Brazil. Its features allows viewing an order from multiple dimensions: from order status, price, payment and freight performance to customer location, product attributes and finally reviews written by customers. We also released a geolocation dataset that relates Brazilian zip codes to lat/lng coordinates.

This is real commercial data, it has been anonymised, and references to the companies and partners in the review text have been replaced with the names of Game of Thrones great houses.

Join it With the Marketing Funnel by Olist
We have also released a Marketing Funnel Dataset. You may join both datasets and see an order from Marketing perspective now!

Instructions on joining are available on this Kernel.

Context


This dataset was generously provided by Olist, the largest department store in Brazilian marketplaces. Olist connects small businesses from all over Brazil to channels without hassle and with a single contract. Those merchants are able to sell their products through the Olist Store and ship them directly to the customers using Olist logistics partners. See more on our website: www.olist.com

After a customer purchases the product from Olist Store a seller gets notified to fulfill that order. Once the customer receives the product, or the estimated delivery date is due, the customer gets a satisfaction survey by email where he can give a note for the purchase experience and write down some comments.

Attention
An order might have multiple items.
Each item might be fulfilled by a distinct seller.
All text identifying stores and partners where replaced by the names of Game of Thrones great houses.

# ERD 
![ERD](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/ERD/Last%20Erd%20Image.png)

# Mapping 
![Mapping](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Mapping/HRhd2Y0.png)

# DB CREATION USING SSIS
![DB CREATION USING SSIS]()

The description of these tables is as follows:

1- olist_orders_dataset: This table is connected to 4 other tables. It is used to connect all the details related to an order.

2- olist_order_items_dataset: It contains the details of an item that had been purchased such as shipping date, price and so on.

3- olist_order_reviews_dataset: It contains details related to any reviews posted by the customer on a particular product that he had purchased.

4- olist_products_dataset: It contains related to a product such as the ID, category name and measurements.

5- olist_order_payments_dataset: The information contained in this table is related to the payment details associated with a particular order.

6- olist_customers_dataset: Details the customer base information of this firm.

7- olist_geolocation_dataset: It contains geographical information related to both the sellers and customers.

8- olist_sellers_dataset: This table contains the information related to all the sellers who have registered with this firm.

# OLTP ERD 

![OLTP ERD ](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/OLTP%20ERD/ERD.PNG)


# DWH CONCEPTUAL MODEL

In our Olist E-Commerce project, we designed a dimensional model following the galaxy schema approach, which allows for complex analysis and reporting across multiple fact tables. Below is a description of the main components of our model: 

![DWH CONCEPTUAL MODEL](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Conceptual%20Model/Olist%20Dimensional%20Model.jpg)

1-Fact Tables:

* Order Sales Fact: Contains detailed information on orders, including customer, seller, product, price, and freight value.

* Order Payment Fact: Tracks payment-specific information such as payment type, installments, and payment value.

2-Dimension Tables:

* Customer Dimension: Stores customer-related data, such as customer city, state, and unique customer identifier.

* Seller Dimension: Holds data about sellers, including location details like city, state, and ZIP code prefix.

* Product Dimension: Contains product attributes such as product name, category, and dimensions.

* Date Dimension: Provides a breakdown of the dates into components like day, month, quarter, and year, useful for time-based analysis.

* Review Dimension: Stores customer feedback details, including review scores.

* Payment Type Dimension: Tracks the type of payment method used for each transaction.

3-Relationships:

The fact tables are connected to the dimension tables through foreign keys. This allows for a flexible analysis of orders, payments, products, reviews, and more over time.

# DWH Implementation Using SSIS


# OLAP

# OLAP Cube Using SSAS

# Paginated Reports Using SSRS 

# Power BI Dashbaords 

## Order Dashboards

## Cusomter Dashboards

## Seller Dashboards

## Product Dashboards

# Tableau Dashbaords

## Order Dashboards

## Cusomter Dashboard

## Product Dashboard

# Excel Dashbaord
## Sales Dashboard

# Data Analysis Using Python
