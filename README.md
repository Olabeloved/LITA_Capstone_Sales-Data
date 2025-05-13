# Project Title: Sales Performance Analysis for a Retail Store 
## Welcome to my Portfolio!
This Project is submitted in partial fulfillment of the requirement for a certification in Data Analysis. In this portfolio, I have included a variety of projects that showcase my data analytics skills. You will find links to the dashboard and reports I have created using various tools such as Power BI, Excel, and SQL. These projects demonstrate my ability to analyze and present data in a clear and visually appealing way, making it easy for decision-makers to understand the insights and take action.
#### Thank you for your time! I am looking forward to receiving a feedback from you soon.

[Context](#context)

[Data Sources](#data-sources)

[Data Description](#data-description)

[Tools Used](#tools-used)

[Data Preparations and Cleaning](#data-preparations-and-cleaning)

[Data Analysis](#data-analysis)

[Insights](insights)

[Conclusions](#conclusions)

[Recommendations](#recommendations)

---
## Context
This project presents the result of the comprehensive analysis of a Sales dataset using Excel, SQL, and Power BI to uncover key business insights. The primary goal was to understand and explore sales data to uncover key insights such as top-selling products, regional performance, and monthly sales trends. The insights from the data will be valuable for understanding behavioural trends, and demographics of each customer, making it useful for marketers and finance researchers.

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
1. Excel:
 - Used the ``` AVERAGEIF ``` function to calculate the average sales per product and the ``` SUMIF ``` function to calculate the total revenue by region

  ![Sales Data Table](https://github.com/user-attachments/assets/6deb1fbf-68be-499f-8bb8-07fa2c55520c)
  

- Used pivot tables to summarize total sales by product, region, and month

 ![Sales Data Pivot Table](https://github.com/user-attachments/assets/d20b7fd1-4ecf-4945-bf49-d7298a98469b)
  

- Created a report dashboard

 ![Sales Data Excel Dashboard](https://github.com/user-attachments/assets/b4057e5a-11f0-460f-9e83-7171789d058b)


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
3. Power BI: created a dashboard that included sales overview, top-performing products, and regional breakdowns

 ![SalesData Dashboard](https://github.com/user-attachments/assets/6690f047-c7ba-4105-b286-46b9d9ec8ced)


## Insights
1. Customer and Product Overview:
- There are 500 customers, 6 unique products, and revenue of 2,101,090 spread across 4 regions.
2. Product Sales by Region:
- West Region: "Hat" has the highest sales, while "Gloves" and "Socks" show lower sales.
- East Region: "Jacket" and "Shirt" are among the top-selling products.
- South Region: "Shoes" has the highest sales, with "Gloves" and "Socks" following.
- North Region: "Shirt" is the top seller, with "Jacket" and "Hat" also performing well.
3. Unit Price by Region:
- North has the highest average unit price (94K or 32.48%), suggesting a possible premium market, while the East and South regions have lower unit prices.
4. Sales by Region:
- South contributes the most to total sales (928K or 44.17%), followed by West (23.23%) and North (18.42%). This suggests that South is a high-performing region.
5. Sales by Product:
- "Shoes" are the top-selling product category, contributing 20.19% of total sales, followed by "Socks" (23.11%) and "Hat" (15.05%).

## Conclusions
- South is the Leading Sales Region: South has the highest total sales, indicating strong customer engagement or a high market share for the company's products.
- Shoes and Socks Are Popular Products: Shoes are the best-selling product, followed by Socks, making these essential items in the inventory.
- North Region Has Higher Unit Prices: North has the highest unit price, suggesting either a higher willingness to pay among customers or the presence of higher-priced items compared to other regions.

## Recommendations
1. Increase Inventory for High-Demand Products: Given that "Shoes" and "Socks" are top sellers, ensure sufficient inventory levels to meet demand and avoid stockouts in regions where these are popular.
   
2. Focus Marketing Efforts in the South Region: As South is the highest-grossing region, consider further targeted marketing campaigns in this region to sustain and grow market share.

3. Adjust Product Pricing or Promotion in Lower-Performing Regions: For the East and West regions, consider offering promotional deals on lower-performing products to drive sales and improve their performance.

4. Expand Product Variety in North: Since North has a higher unit price, it may be a good market for introducing premium product options or exclusive items to capture customers willing to spend more.

5. Tailor Product Offerings by Region: For example, since "Hat" sells well in the West and "Shoes" in the South, consider customizing product mixes for each region based on customer preferences.

6. Explore Opportunities for Growth in the West Region: While the West has a moderate sales volume, focused promotions or new product introductions could help it grow its market share and reduce dependence on high-performing regions. 

