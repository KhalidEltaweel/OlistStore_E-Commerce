# Olist-E-Commerce Project
Olist-E-Commerce is a graduation project developed as part of the Power BI Development Track. The main objective of this project was to build a data warehouse and perform data analysis on a publicly available dataset. The dataset represents a Brazilian e-commerce business, and through this project, we aimed to uncover valuable insights. 

# Summary
In this project, we:

1-Created an ERD (Entity-Relationship Diagram): We started by analyzing the data structure and visualizing relationships.

2-Built a Database: We used the Olist dataset from Kaggle to set up the database.

3-Constructed a Data Warehouse: The data warehouse was designed using a galaxy schema to facilitate analytics and reporting.

4-ETL Process: We implemented an Extract, Transform, Load (ETL) process using Microsoft SQL Server Integration Services (SSIS).

5-OLAP Server: We built an OLAP (Online Analytical Processing) server using Microsoft SQL Server Analysis Services (SSAS).

6-Data Analysis and Visualization: We extracted insights using Microsoft Power BI, Tableau, and Excel, with paginated reports created in SQL Server Reporting Services (SSRS).

7-Data Mining: We used Python for deeper data analysis and mining.

# About the Company
Olist is an e-commerce company headquartered in Sao Paulo, Brazil. The company connects small businesses to customers across multiple online marketplaces, acting as a single point of contact for sales and logistics.

# About the Dataset

The dataset used in this project is publicly available and includes over 100,000 orders placed from 2016 to 2018 across various Brazilian marketplaces. You can access it on [Olist Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/data).

# ERD 
![ERD](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/ERD/Last%20Erd%20Image.png)

# Mapping 
![Mapping](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Mapping/HRhd2Y0.png)

# DB CREATION USING SSIS
![DB CREATION USING SSIS]()

# OLTP ERD 

![OLTP ERD ](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/OLTP%20ERD/ERD.PNG)


# DWH CONCEPTUAL MODEL

In our Olist E-Commerce project, we designed a dimensional model following the galaxy schema approach, which allows for complex analysis and reporting across multiple fact tables. Below is a description of the main components of our model: 

![DWH CONCEPTUAL MODEL](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Conceptual%20Model/Olist%20Dimensional%20Model.jpg)

1-Fact Tables:

-Order Sales Fact: Contains detailed information on orders, including customer, seller, product, price, and freight value.

-Order Payment Fact: Tracks payment-specific information such as payment type, installments, and payment value.

2-Dimension Tables:

-Customer Dimension: Stores customer-related data, such as customer city, state, and unique customer identifier.

-Seller Dimension: Holds data about sellers, including location details like city, state, and ZIP code prefix.

-Product Dimension: Contains product attributes such as product name, category, and dimensions.

-Date Dimension: Provides a breakdown of the dates into components like day, month, quarter, and year, useful for time-based analysis.

-Review Dimension: Stores customer feedback details, including review scores and timestamps.

-Payment Type Dimension: Tracks the type of payment method used for each transaction.

3-Relationships:

The fact tables are connected to the dimension tables through foreign keys. This allows for a flexible analysis of orders, payments, products, reviews, and more over time.
