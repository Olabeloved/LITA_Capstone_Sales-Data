# Project Title: Sales Data Analysis
## Welcome to my Portfolio!
This Project is submitted in partial fulfillment of the requirement for a certification in Data Analysis. In this portfolio, I have included a variety of projects that showcase my data analytics skills. You will find links to the dashboard and reports I have created using various tools such as Power BI, Excel, and SQL. These projects demonstrate my ability to analyze and present data in a clear and visually appealing way, making it easy for decision-makers to understand the insights and take action.
#### Thank you for your time! I am looking forward to receiving feedback from you soon.

[Context](#context)

[Data Sources](#data-sources)

[Data Description](#data-description)

[Tools Used](#tools-used)

[Data Preparations and Cleaning](#data-preparations-and-cleaning)

[Data Analysis](#data-analysis)

[Conclusion](#conclusion)

---
## Context
This project presents the result of the comprehensive analysis of a Sales dataset using Excel, SQL, and Power BI to uncover key business insights. The primary goal was to understand sales patterns, product performance, and regional contributions to overall revenue. The insights from the data will be valuable for understanding behavioural trends, and demographics of each customer, making it useful for marketers and finance researchers

## Data Sources
The primary source of data used is the Incubator Hub.

## Data Description
This dataset provides insights into the sales pattern of 500 customers, it includes the following column:
- OrderID
- CustomerID
- Product
- Region
- OrderDate
- Quantity
- UnitPrice

## Tools Used
 1. Microsoft Excel: Removed and cleaned any inconsistencies in the data and handled missing values. Also created pivot tables to organize and summarize data. [Download Here](https://www.microsoft.com)
 2. SQL: Loaded the cleaned dataset into SQL Server, wrote, and validated queries to extract insights directly from the dataset. [Download Here](https://www.microsoft.com)
 3. Power BI: Created interactive dashboards to showcase findings and visualizations [Download Here](https://www.microsoft.com)

## Data Preparations and Cleaning
- Data Quality Check: The data types of each column were changed to their respective data types
- Duplicates: the dataset contained over a thousand duplicates, it was detected using conditional formatting, and the duplicates were removed using the remove duplicates in the data tab

## Data Analysis
1. Excel
2. SQL: wrote queries to extract key insights
   ### SQL Query
- Total Sales per Product Category
  ```SQL
  SELECT [Product],
  SUM(Total_Sales) AS Total_Sales from Sales_Data
  GROUP BY [Product]
  ```
- Sales Transaction by Region
  ```SQL
  SELECT Region,
  Count(OrderID) AS Number_of_Transactions from Sales_Data
  GROUP BY Region
  ```
- Highest-selling product by total sales value
  ```SQL
  SELECT top 1 [Product],
  SUM(Total_Sales) as Total_Sales from Sales_Data
  group by [Product]
  ```
- Total revenue per product
  ```SQL
  select [Product],
  sum(Total_Sales) AS Total_Revenue from Sales_Data
  group by [Product]
  ```
- Monthly sales totals for the current year
  ```SQL
  select month(OrderDate) as [Month],
  sum(Total_Sales) as Monthly_Sales from Sales_Data
  where year(OrderDate) = YEAR(GETDATE())
  group by month(OrderDate)
  order by month desc
  ```
- Top 5 customers by total purchase amount
  ```SQL
  select Top 5 Customer_Id,
  sum(Total_Sales) as Total_Purchase from Sales_Data
  group by Customer_Id
  order by Total_Purchase desc
  ```
- Percentage of total sales contributed by each region
  ```SQL
  select Region,
  SUM(Total_Sales) as Region_Sales,
  cast(sum(Total_Sales) * 100.0 / (select sum(Total_Sales) from Sales_Data)
  as decimal(5, 2)) as Sales_Percentage
  from Sales_Data
  group by region
  ```
- Identify products with no sales in the last quarter
  ```SQL
  select [Product] from Sales_Data
  group by [Product],
  case
        when OrderDate between '2024-06-01' and '2024-08-31' then 1
  	else 0
  end
  ```
3. Power BI

## Conclusion

