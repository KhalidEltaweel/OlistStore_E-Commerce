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
![ERD](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/ERD/Final%20ERD.jpg)

# Mapping 
![Mapping](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Mapping/HRhd2Y0.png)

# DB CREATION USING SSIS

![DB CREATION USING SSIS](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Database%20Using%20SQL%20Server%26SSIS/DB%20creation/ScreenShots/SSIS%201.jpeg)

![DB CREATION USING SSIS](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Database%20Using%20SQL%20Server%26SSIS/DB%20creation/ScreenShots/SSIS%202.jpeg)

## Geolocation Validation 

![DB CREATION USING SSIS](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Database%20Using%20SQL%20Server%26SSIS/DB%20creation/ScreenShots/Geolocation%20Validation.jpeg)
 
![DB CREATION USING SSIS](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Database%20Using%20SQL%20Server%26SSIS/DB%20creation/ScreenShots/Geolocation%20Validation2.jpeg)

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
## Galaxy Schema
![DWH](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Implementation%20Using%20SSIS/ScreenShots/DimCustomer.JPG)

![DWH](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Implementation%20Using%20SSIS/ScreenShots/DimOrderReview.JPG)

![DWH](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Implementation%20Using%20SSIS/ScreenShots/DimPaymentType.JPG)

![DWH](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Implementation%20Using%20SSIS/ScreenShots/DimProduct.JPG)

![DWH](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Implementation%20Using%20SSIS/ScreenShots/DimSeller.JPG)

![DWH](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Implementation%20Using%20SSIS/ScreenShots/FactOrderPayment.JPG)

![DWH](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Implementation%20Using%20SSIS/ScreenShots/FactOrderSales.JPG)

## Incremental Load

![DWH](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Implementation%20Using%20SSIS/ScreenShots/IncrementalLoad-FactOrderSales.JPG)

![DWH](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Implementation%20Using%20SSIS/ScreenShots/IncrementalLoad-FactOrderPayment.JPG)

## Triggers For Incremental Load



# OLAP
![OLAP](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/DWH%20Conceptual%20Model/OLAP.JPG)
# OLAP Cube Using SSAS

![OLAP](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Cubes%20Using%20SSAS/ScreenShots/View.jpeg)

![OLAP](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Cubes%20Using%20SSAS/ScreenShots/Schema.jpeg)

![OLAP](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Cubes%20Using%20SSAS/ScreenShots/Browser%20Example%201.jpeg)

![OLAP](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Cubes%20Using%20SSAS/ScreenShots/Browser%20Example2.jpeg)

# Paginated Reports Using SSRS 

![Paginated](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Paginated%20Reports%20Using%20SSRS/Screenshots/Customer%20Geographics.PNG)

![Paginated](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Paginated%20Reports%20Using%20SSRS/Screenshots/Customer%20Satisfaction.PNG)

![Paginated](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Paginated%20Reports%20Using%20SSRS/Screenshots/Payment%20Method%20Analysis.PNG)

![Paginated](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Paginated%20Reports%20Using%20SSRS/Screenshots/Product%20Performance.PNG)

![Paginated](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Paginated%20Reports%20Using%20SSRS/Screenshots/Sales%20Performance.PNG)

![Paginated](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Paginated%20Reports%20Using%20SSRS/Screenshots/Seller%20Performance.PNG)

![Paginated](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Paginated%20Reports%20Using%20SSRS/Screenshots/Total%20Revenue%20By%20%20Category-%20Filtered.PNG)


# Power BI Dashbaords 

## Order Dashboards

![Order Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Order%20Dashboards/ScreenShots/Order%20Dashboards_page-0001.jpg)

![Order Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Order%20Dashboards/ScreenShots/Order%20Dashboards_page-0002.jpg)

![Order Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Order%20Dashboards/ScreenShots/Order%20Dashboards_page-0003.jpg)

![Order Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Order%20Dashboards/ScreenShots/Order%20Dashboards_page-0004.jpg)

![Order Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Order%20Dashboards/ScreenShots/Order%20Dashboards_page-0005.jpg)

![Order Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Order%20Dashboards/ScreenShots/Order%20Dashboards_page-0006.jpg)

![Order Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Order%20Dashboards/ScreenShots/Order%20Dashboards_page-0007.jpg)

![Order Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Order%20Dashboards/ScreenShots/Order%20Dashboards_page-0008.jpg)

![Order Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Order%20Dashboards/ScreenShots/Order%20Dashboards_page-0009.jpg)


## Customer Dashboards

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Customer%20Dashboards/ScreenShots/Customer%20Dashboards_page-0001.jpg)
![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Customer%20Dashboards/ScreenShots/Customer%20Dashboards_page-0002.jpg)
![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Customer%20Dashboards/ScreenShots/Customer%20Dashboards_page-0003.jpg)
![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Customer%20Dashboards/ScreenShots/Customer%20Dashboards_page-0004.jpg)
![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Customer%20Dashboards/ScreenShots/Customer%20Dashboards_page-0005.jpg)
![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Customer%20Dashboards/ScreenShots/Customer%20Dashboards_page-0006.jpg)
![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Customer%20Dashboards/ScreenShots/Customer%20Dashboards_page-0007.jpg)
![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Customer%20Dashboards/ScreenShots/Customer%20Dashboards_page-0008.jpg)
![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Customer%20Dashboards/ScreenShots/Customer%20Dashboards_page-0009.jpg)
![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Customer%20Dashboards/ScreenShots/Customer%20Dashboards_page-0010.jpg)
![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Customer%20Dashboards/ScreenShots/Customer%20Dashboards_page-0011.jpg)


## Seller Dashboards
![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0001.jpg)

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0002.jpg)

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0003.jpg)

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0004.jpg)

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0005.jpg)

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0006.jpg)


![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0007.jpg)

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0008.jpg)

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0009.jpg)

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0010.jpg)

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0011.jpg)

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0012.jpg)

![Cusomter Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Seller%20Dashboards/ScreenShots/Seller%20Dashboards_page-0013.jpg)


## Product Dashboards

![Product Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Product%20Dashboards/ScreenShots/Num%20Of%20Products%20%26%20Products%20Sold_page-0001.jpg)

![Product Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Product%20Dashboards/ScreenShots/Product%20Overview_page-0001.jpg)

![Product Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Product%20Dashboards/ScreenShots/Products%20Regions_page-0001.jpg)


![Product Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Product%20Dashboards/ScreenShots/Products%20Regions_page-0002.jpg)

![Product Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Power%20BI%20Dashboards/Product%20Dashboards/ScreenShots/Products%20Sales%20%26%20Units%20sold_page-0001.jpg)


# Tableau Dashbaords

## Order Dashboards

![Order Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Tableau%20Dashboards/ScreenShots/Sales%20Overview.png)


![Order Dashboards](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Tableau%20Dashboards/ScreenShots/Total%20Sales%20By%20Customer%20States%20map.png)


## Customer Dashboard

![Customer](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Tableau%20Dashboards/ScreenShots/Customer%20Overview.png)


## Product Dashboard
![Product](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Tableau%20Dashboards/ScreenShots/Product%20Dashboard.png)

# Excel Dashbaord

## Pivot Tables
![Pivot](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/EXCEL%20Dashboards/Pivot/No.%20Orders%20By%20Order%20Status.JPG)


![Pivot](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/EXCEL%20Dashboards/Pivot/Total%20Sales%20By%20Category.JPG)


![Pivot](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/EXCEL%20Dashboards/Pivot/Total%20Sales%20By%20Customer%20City.JPG)


![Pivot](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/EXCEL%20Dashboards/Pivot/Total%20Sales%20By%20Month%20Name.JPG)


## Sales Dashboard
![Sales](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/EXCEL%20Dashboards/Olist%20Project_.jpg)

# Data Analysis Using Python

You can find python notebook at the following link:
[Python EDA](https://github.com/KhalidEltaweel/OlistStore_E-Commerce/blob/main/Final/Python/Python%20EDA.ipynb).

# Results From All Pervious Analysis

1. Customer Insights
*	Total Customers: 96,096
*	Total Orders: 99,441
*	Total Sales: $13.55M
*	Total Freight: $2.01M
*	Top Customer Cities: São Paulo, Rio de Janeiro, Belo Horizonte, Brasília, Curitiba, Campinas, Porto Alegre, Salvador.
*	Customer Growth: Peaked in March (10,832 customers) and dipped in February (5,761 customers).
*	Customer Retention: 10,275 returning customers, with a repeat purchase rate of 40%.
*	Customer Behavior: Peak order hour is 4 PM, with Fridays being the busiest day.
*	Price Sensitivity: 58.77% of orders are low-value, while only 3.47% are high-value.
*	Customer Feedback: Average review score is 4.09, with the highest scores in March (4.25) and the lowest in April (3.80).
*	Customer Distribution: São Paulo has the highest number of customers (14,984), followed by Rio de Janeiro (6,620) and Belo Horizonte (2,672).
*	Customer Growth: Customer growth fluctuates significantly by month, with the highest growth in March (10,832 customers) and the lowest in February (5,761).
*	Price Sensitivity: 58.77% of orders are low-value, indicating that most customers are price-sensitive and prefer affordable products.
*	Feedback Trends: The most common positive review keywords include "Recomendo" (recommend), "QUALIDADE" (quality), and "Entrega" (delivery). Negative feedback often mentions "demorou" (took too long) and "problemas" (problems).

2. Order Insights
-	Order Fulfillment: 97.02% delivery rate, with 70.85% of orders delayed.
*	Average delivery delay is 8.74 days.
*	Cancellation rate is 0.63%.
-	Payment Preferences:
*	75.24% of orders are paid via credit card, followed by boleto (19.46%).
*	Installment usage rate is 51.46%.
*	Geographic Sales Performance: São Paulo, Rio de Janeiro, and Belo Horizonte are the top-performing cities.
*	Order Dynamics: Peak order hour is 4 PM, with the slowest hour being 5 AM.
*	Delivery Delays: 70.85% of orders are delayed, with an average delay of 8.74 days. The longest delays occur in cities like Bom Jesus dos Perdões (45 days).
*	Cancellation Rate: The cancellation rate is relatively low at 0.63%, but it still represents 625 orders.
*	Freight Costs: Total freight costs are 2.01M,which is a significant portion of the total sales (2.01M,which is a significant portion of the total sales(13.55M).

3. Seller Insights
*	Total Sellers: 3,095
*	Top Sellers by Sales: Seller IDs 6560211a19b47..., 4a3ca9315b744..., and cc419e0650a3c... are the top performers.

4.	Seller Performance:
*	Average review score is 4.09.
*	Sellers in Bom Jesus dos Perdões have the highest average processing duration (45 days).
*	Product Performance:
*	Top product categories by sales: beleza_saude (1.26M),∗∗relogiospresentes∗∗(1.26M),∗∗relogiospresentes∗∗(1.2M), and cama_mesa_banho ($1.05M).
*	Top product categories by orders: cama_mesa_banho (9,417 orders), beleza_saude (8,836 orders), and esporte_lazer (7,720 orders).
*	Top Sellers: The top 10 sellers account for a significant portion of total sales, with Seller ID 6560211a19b47... generating $1.85K in sales.
*	Seller Cities: Sellers in São Paulo and Rio de Janeiro dominate sales, while sellers in smaller cities like Bom Jesus dos Perdões have longer processing times.
*	Product Categories: The top-performing categories (beleza_saude, relogios_presentes, and cama_mesa_banho) account for the majority of sales, while categories like ferramentas_jardim and automotivo underperform.


4. Geographic Sales Performance
*	Top Cities: São Paulo, Rio de Janeiro, and Belo Horizonte are the top-performing cities, contributing significantly to total sales.
*	Underperforming Regions: Cities like Niterói and Guarulhos have lower sales and fewer customers, indicating untapped potential.

5. Payment Trends
*	Payment Methods: Credit cards are the most popular payment method (75.24%), followed by boleto (19.46%). Debit cards and vouchers are rarely used.
* Installment Usage: 51.46% of orders use installments, indicating that customers prefer flexible payment options.
6. Product Performance
* Top Products: Categories like beleza_saude and relogios_presentes have the highest sales and orders.
*	Low-Performing Products: Categories like ferramentas_jardim and automotivo have low sales and fewer orders, suggesting a need for better marketing or product improvements.


# Recommendations 

1. Improve Delivery Times

*	Issue: 70.85% of orders are delayed, with an average delay of 8.74 days.
* Recommendation: Optimize logistics and partner with more reliable shipping providers to reduce delivery delays. Focus on improving delivery times in cities with the highest delays.

2. Increase High-Value Orders

*	Issue: Only 3.47% of orders are high-value.
*	Recommendation: Implement upselling and cross-selling strategies, such as bundling products or offering discounts on high-value items. Target high-value customers with personalized offers.

3. Enhance Customer Retention

*	Issue: Repeat purchase rate is 40%, and retention rates are low (2.03%-3.14% by quarter).
* Recommendation: Launch loyalty programs, offer exclusive discounts to returning customers, and send personalized follow-up emails to encourage repeat purchases.

4. Optimize Payment Options
*	Issue: 75.24% of orders are paid via credit card, but installment usage is only 51.46%.
*	Recommendation: Promote installment payment options more aggressively, especially for high-value items, to make them more accessible to customers.
5. Focus on Top-Performing Cities
*	Issue: São Paulo, Rio de Janeiro, and Belo Horizonte account for the majority of sales.
*	Recommendation: Allocate more marketing resources to these cities to further boost sales. Additionally, analyze underperforming cities to identify growth opportunities.

6. Improve Seller Performance

*	Issue: Sellers in Bom Jesus dos Perdões have the highest processing duration (45 days).
*	Recommendation: Provide training and resources to sellers with long processing times to improve efficiency. Consider incentivizing faster order processing.

7. Address Negative Reviews
*	Issue: Average review score dropped to 3.80 in April.
*	Recommendation: Analyze negative feedback from April and address common issues such as product quality, delivery delays, or customer service. Implement a system to respond to negative reviews promptly.

8. Boost Sales in Low-Performing Product Categories
*	Issue: Categories like ferramentas_jardim and automotivo have lower sales compared to top categories.
*	Recommendation: Run targeted promotions or discounts for low-performing categories to increase their visibility and sales.

9. Optimize Peak Order Hours
*	Issue: Peak order hour is 4 PM, with the slowest hour being 5 AM.
*	Recommendation: Run flash sales or promotions during slower hours (e.g., early morning) to balance order distribution and reduce server load during peak times.

10. Expand Seller Base
*	Issue: Only 3,095 sellers are active, with a few dominating sales.
*	Recommendation: Recruit more sellers, especially in underrepresented regions or categories, to diversify the product offering and increase competition.

11. Target Underperforming Regions
*	Issue: Cities like Niterói and Guarulhos have lower sales and fewer customers.
*	Recommendation: Launch targeted marketing campaigns in these regions to increase brand awareness and attract more customers. Consider offering region-specific promotions or discounts.

12. Reduce Freight Costs
*	Issue: Freight costs are high ($2.01M), impacting overall profitability.
*	Recommendation: Negotiate better rates with shipping providers or explore alternative logistics solutions. Consider offering free shipping thresholds to incentivize larger orders.

13. Improve Seller Training
* Issue: Sellers in smaller cities have longer processing times, leading to delays.
*	Recommendation: Provide training programs for sellers to improve order processing efficiency. Offer incentives for sellers who consistently meet delivery deadlines.
14. Enhance Customer Feedback System

*	Issue: Negative feedback often mentions delivery delays and product issues.
*	Recommendation: Implement a more robust feedback system to address customer concerns promptly. Use AI tools to analyze feedback trends and identify recurring issues.

15. Promote Underperforming Product Categories
*	Issue: Categories like ferramentas_jardim and automotivo have low sales.
*	Recommendation: Run targeted promotions, bundle these products with best-sellers, or improve product descriptions and images to make them more appealing.

16. Optimize Marketing During Peak Hours
*	Issue: Peak order hour is 4 PM, with the slowest hour being 5 AM.
*	Recommendation: Run targeted ads or promotions during slower hours to balance order distribution. Use email marketing to engage customers during off-peak times.

17. Expand Payment Options
*	Issue: Debit cards and vouchers are rarely used.
*	Recommendation: Promote alternative payment methods like debit cards and vouchers to attract customers who prefer these options. Offer discounts for using specific payment methods.

18. Improve Product Quality
*	Issue: Negative reviews mention product quality issues.
*	Recommendation: Work with sellers to improve product quality and ensure that all items meet customer expectations. Implement stricter quality control measures.

19. Increase Seller Diversity
*	Issue: A few sellers dominate sales, limiting product diversity.
* Recommendation: Recruit more sellers, especially in underrepresented categories or regions, to diversify the product offering and increase competition.

20. Leverage Data for Personalization

*	Issue: Customer behavior data is underutilized.
*	Recommendation: Use customer data to create personalized recommendations and offers. Implement AI-driven tools to analyze customer preferences and tailor marketing campaigns accordingly.

21. Focus on Seasonal Trends
*	Issue: Customer growth and sales fluctuate significantly by month.
*	Recommendation: Analyze seasonal trends and plan marketing campaigns accordingly. For example, offer discounts or promotions during months with lower sales to boost revenue.

22. Improve Review Response Rate
*	Issue: Negative reviews are not always addressed promptly.
*	Recommendation: Implement a system to respond to reviews within 24 hours, especially negative ones. Show customers that their feedback is valued and take steps to resolve issues.

23. Enhance Mobile Experience
*	Issue: No data on mobile vs. desktop usage, but mobile optimization is critical for e-commerce.
*	Recommendation: Ensure the platform is fully optimized for mobile devices, as many customers likely shop via smartphones. Improve app performance and user experience.

24. Offer Subscription Services
*	Issue: Low repeat purchase rates in some categories.
*	Recommendation: Introduce subscription services for high-demand products (e.g., beauty or health items) to encourage repeat purchases and build customer loyalty.

25. Monitor Competitor Pricing

*	Issue: Price sensitivity is high among customers.
*	Recommendation: Regularly monitor competitor pricing and adjust strategies accordingly. Offer price-matching guarantees or exclusive deals to stay competitive.

