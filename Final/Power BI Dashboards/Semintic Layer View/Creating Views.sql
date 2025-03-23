--test 
SELECT count(distinct c.customer_sk), MonthName
FROM DimCustomer c JOIN FactOrderSales f
ON c.customer_sk = f.customer_sk
JOIN DimDate d
ON f.date_sk = d.datesk
GROUP BY MonthName

--test
select COUNT(*), order_id from FactOrderSales group by order_id  having count(*) > 1 
select * from FactOrderSales WHERE order_id = '03aba68b07658f28f29612641f08d4ba'

SELECT MIN(order_purchase_date_fk), MAX(order_delivered_customer_date_fk)
FROM FactOrderSales







--Customer growth over time.
CREATE VIEW Customer_Growth_over_time AS 
SELECT count(distinct customer_unique_id) as Customer_growth , Date
FROM DimCustomer c JOIN FactOrderSales f
ON c.customer_sk = f.customer_sk
JOIN DimDate d
ON f.date_sk = d.datesk
GROUP BY Date

---Total Sales
CREATE VIEW Total_Sales AS 
SELECT sum(price) AS Order_Price, order_id
from FactOrderSales
group by order_id

--Average review score by category name
create view Average_score_category as
select AVG(review_score) as average_score, product_category_name
from FactOrderSales f join DimOrderReview o
on f.order_review_sk = o.order_review_sk
join DimProduct p
on f.product_sk = p.product_sk
group by product_category_name

--Cohort Calculation
CREATE VIEW CustomerCohort AS
SELECT
    FOS.customer_sk,
    MIN(DD.Date) AS FirstPurchaseDate,
    MONTH(MIN(DD.Date)) AS CohortMonth
FROM
    FactOrderSales FOS
JOIN
    DimDate DD ON FOS.order_purchase_date_fk = DD.DateSk
GROUP BY FOS.customer_sk;


--MonthlyCustomerActivity

CREATE VIEW MonthlyCustomerActivity AS
SELECT
    FOS.customer_sk,
    DATEDIFF(MONTH, CC.FirstPurchaseDate, DD.Date) AS MonthsSinceFirstPurchase,
    COUNT(DISTINCT FOS.order_sales_sk) AS ActiveOrders
FROM
    FactOrderSales FOS
JOIN
    DimDate DD ON FOS.order_purchase_date_fk = DD.DateSk
JOIN
    CustomerCohort CC ON FOS.customer_sk = CC.customer_sk
GROUP BY FOS.customer_sk, DD.Date, CC.FirstPurchaseDate;

--Retention Rate

CREATE VIEW RetentionRate AS
SELECT
    CC.CohortMonth,
    DATEDIFF(MONTH, CC.FirstPurchaseDate, DD.Date) AS MonthsSinceFirstPurchase,
    COUNT(DISTINCT FOS.customer_sk) AS ActiveCustomers,
    (COUNT(DISTINCT FOS.customer_sk) * 100.0) / 
    (SELECT COUNT(DISTINCT customer_sk) FROM CustomerCohort WHERE CohortMonth = CC.CohortMonth) AS RetentionRate
FROM
    CustomerCohort CC
JOIN
    FactOrderSales FOS ON CC.customer_sk = FOS.customer_sk
JOIN
    DimDate DD ON FOS.order_purchase_date_fk = DD.DateSk
GROUP BY 
    CC.CohortMonth, 
    DATEDIFF(MONTH, CC.FirstPurchaseDate, DD.Date);

--Churn Probability

CREATE VIEW ChurnRisk AS
SELECT
    FOS.customer_sk,
    DATEDIFF(DAY, MAX(DD.Date), GETDATE()) AS Recency,
    COUNT(DISTINCT FOS.order_sales_sk) AS Frequency,
    SUM(FOS.price) AS TotalValue,
    -- Example of Churn Formula (you can adjust it based on data)
    CASE 
        WHEN DATEDIFF(DAY, MAX(DD.Date), GETDATE()) > 180 THEN 0.7
        WHEN COUNT(DISTINCT FOS.order_sales_sk) < 3 THEN 0.5
        ELSE 0.2
    END AS ChurnProbability
FROM
    FactOrderSales FOS
JOIN
    DimDate DD ON FOS.order_purchase_date_fk = DD.DateSk
GROUP BY FOS.customer_sk;

--Customer Lifetime 
CREATE VIEW CustomerLifetimeValue AS
SELECT
    FOS.customer_sk,
    DATEDIFF(MONTH, CC.FirstPurchaseDate, DD.Date) AS TenureMonths,
    SUM(FOS.price) AS CumulativeValue
FROM
    FactOrderSales FOS
JOIN
    DimDate DD ON FOS.order_purchase_date_fk = DD.DateSk
JOIN
    CustomerCohort CC ON FOS.customer_sk = CC.customer_sk
GROUP BY FOS.customer_sk, DD.Date, CC.FirstPurchaseDate;


--total freight calculation
CREATE VIEW total_freight_cal AS 
WITH total_freight_cal AS (
    SELECT order_id, MAX(freight_value) AS freight_value
    FROM FactOrderSales
    GROUP BY order_id
)
SELECT SUM(freight_value) AS total_freight 
FROM total_freight_cal;
--calculate peak hour and number of orders of that hour
CREATE VIEW peak_hour_cal AS                      
SELECT TOP 1
    CAST(DATEPART(HOUR, purchase_time) AS VARCHAR(2)) +
    CASE 
        WHEN DATEPART(HOUR, purchase_time) >= 12 THEN ' PM'
        ELSE ' AM'
    END AS PurchaseHour,                          
    COUNT(DISTINCT order_id) AS PurchaseCount                     
FROM 
    FactOrderSales                                     
GROUP BY 
    DATEPART(HOUR, purchase_time)                
ORDER BY 
    PurchaseCount DESC                           


--Average review score by seller_id & date 
create view Average_score_seller as
select AVG(review_score) as average_score, seller_id, date, product_category_name
from FactOrderSales f join DimOrderReview o
on f.order_review_sk = o.order_review_sk
join
DimSeller s
on f.seller_sk = s.seller_sk
join DimDate dd
on f.date_sk = dd.DateSK
join DimProduct p
on f.product_sk = p.product_sk
group by seller_id,date, product_category_name