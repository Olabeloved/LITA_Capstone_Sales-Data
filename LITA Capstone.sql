CREATE DATABASE LITA_Capstone

SELECT * FROM Sales_Data

-----the total sales for each product category
SELECT [Product],
SUM(Total_Sales) AS Total_Sales from Sales_Data
GROUP BY [Product]

------the number of sales transactions in each region
SELECT Region,
Count(OrderID) AS Number_of_Transactions from Sales_Data
GROUP BY Region

------the highest-selling product by total sales value
SELECT top 1 [Product],
SUM(Total_Sales) as Total_Sales from Sales_Data
group by [Product]

SELECT * FROM Sales_Data

------total revenue per product
select [Product],
sum(Total_Sales) AS Total_Revenue from Sales_Data
group by [Product]

--------monthly sales totals for the current year
select month(OrderDate) as [Month],
sum(Total_Sales) as Monthly_Sales from Sales_Data
where year(OrderDate) = YEAR(GETDATE())
group by month(OrderDate)
order by month desc

SELECT * FROM Sales_Data

-------top 5 customers by total purchase amount
select Top 5 Customer_Id,
sum(Total_Sales) as Total_Purchase from Sales_Data
group by Customer_Id
order by Total_Purchase desc

-------percentage of total sales contributed by each region
select Region,
SUM(Total_Sales) as Region_Sales,
cast(sum(Total_Sales) * 100.0 / (select sum(Total_Sales) from Sales_Data)
as decimal(5, 2)) as Sales_Percentage
from Sales_Data
group by region

------identify products with no sales in the last quarter
select [Product] from Sales_Data
group by [Product],
case
      when OrderDate between '2024-06-01' and '2024-08-31' then 1
	else 0
end



-------------project 2: Customer Data-------------------
select * from Customer_Data

---------1. to retrieve the total number of customers from each region
SELECT Region,
count(CustomerID) AS Total_Customers from Customer_Data
GROUP BY Region

-------------2. the most popular subscription type by the number of customers
select top 1 SubscriptionType,
count(CustomerID) as SubscriptionType_by_Customer from Customer_Data
Group by SubscriptionType
Order by SubscriptionType_by_Customer desc

-------------3. find customers who canceled their subscription within 6 months
select CustomerID, SubscriptionStart, SubscriptionEnd
from Customer_Data
where DATEDIFF(month, SubscriptionStart, SubscriptionEnd) <= 6     --------no customer with subscription within 6 months

------------4. the average subscription duration for all customers
select AVG(DATEDIFF(month, SubscriptionStart, SubscriptionEnd)) as Average_Subscription_Duration
from Customer_Data

-------------5. customers with subscriptions longer than 12 months
select CustomerID, SubscriptionStart, SubscriptionEnd
from Customer_Data
where DATEDIFF(month, SubscriptionStart, SubscriptionEnd) > 12     -----no customer with subscription longer than 12 months

------------6. total revenue by subscription type
select SubscriptionType,
sum(Revenue) as Total_Revenue
from Customer_Data
group by SubscriptionType

----------------7. top 3 regions by subscription cancellations
select top 3 Region,
count(*) as Cancellations
from Customer_Data
where Canceled = 'TRUE'
group by Region
order by Cancellations desc

-------------8. total number of active and canceled subscriptions
select Canceled, count (*) as Total from Customer_Data
group by Canceled