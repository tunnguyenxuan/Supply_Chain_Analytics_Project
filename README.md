# Supply Chain Inefficiency Analytics Project

## Table of Contents

### Project Overview
---
As the main data analyst for Just In Time, I will analyze supply chain inefficiencies through univariate and bivariate EDA of over 30,000 order records of the company during 2015 - 2017 period , define the key problem through SCQ Framework, identify root causes using diagnostic based tree and hypothesis testing techniques using Python libraries (Pandas, Seaborn, Matplotlib, etc) to  and propose structural business improvements.

![image](https://github.com/user-attachments/assets/35ec568e-34ea-4e9b-a063-13f13a60bc9d)
![image](https://github.com/user-attachments/assets/7e70ce3f-093e-4467-96c0-8af271f26241)

### Data Sources
---
The project is conducted using the data source created and copyrighted by ***Maven Analytics***.

### Tools
---
* MS-Excel - Data Cleaning
* ER Assistant, MySQL Workbench - Data Modeling
* Python - Data Processing and Analytics

### Methods
---
1. Conduct univariate and bivariate EDA to understand the data, explore outliers and variable relationships.
2. Formulate project questions using Situation - Complication - Question (SCQ) framework to identify supply chain problems appropriated to business context.
3. Identify root causes of the problem using diagnostic based tree to formulate key hypotheses.
4. Test hypotheses through data analytics using Python libraries: Matplotlib, Seaborn, Pandas, Numpy, etc.

### Data Cleansing/Prepartion
---
1. Drop unnecessary columns (Order Timestamp)
2. Appropriate the data types of columns
3. Check for missing, duplicated values
4. Drop records where shipment dates are before order dates.
5. Drop records where profit is larger than net sales (gross sales - discount)
6. After checking for unqiue values of product names in both ***order*** and ***inventory*** tables, there are 113 products being ordered but 118 products being stocked in inventory. Therefore, I expand the initial 3 raw tables into 6 dimensional tables and 1 fact tables as follows:
* Dimensional tables: product, geo, fulfillment, inventory, shipmode, warehouse
* Fact table: order

### Data Modeling
---
1. Create ER Diagram using ER Assistant to investigate consistency, and completeness errors of the relationships, cardinalities, entities, and respective attributes.
![image](https://github.com/user-attachments/assets/72a6b522-c529-4698-b1d3-1cf0477291d3)
2. Model data using reverse engineer and sychronization tools in MySQL Workbench.
![image](https://github.com/user-attachments/assets/cd1f2a78-d232-4585-95c5-7dc1f58c52db)

### Exploratory Data Analysis
---
Questions:
**Fulfillment Efficiency**
1. What is the average time it takes to fulfill an order (Order Fulfillment Cycle Time)?
2. What percentage of orders are shipped on time (On-Time Shipping Percentage)?
**Sales**
1. Which product depts, order ranges generate the most revenue and profit?
2. What is the overall sales growth rate and profit margin trend over time? Are there seasonal patterns?
3. How do discounts impact sales volume and profitability?
4. What is the relationship between supply chain costs and sales revenue (Inventory-to-Sales Ratio)?
**Inventory Optimization**
1. What is the total order quantity? total stock in inventory?
2. Which Top 10 product names account for the most and the least  order quantity, respectively?
3. Which Top 10 products account for the most inventory cost?

Finding Summary:
1. The total order quantity, and warehouse inventory of 2017 is 24% and 20% smaller than the average of 2015 and 2016. The majority of orders contain 2-3 order items, contributing to a profit margin of over 0.8. However, there are no order of 5 following products in 3-year period:
* SOLE E35 Elliptical
* Bushnell Pro X7 Jolt Slope Rangefinder
* SOLE E25 Elliptical
* Bowflex SelectTech 1090 Dumbbells
* Dell Laptop
2. Top 3 sales and profitable categories, namely fishing, camping & hiking, and cleate, demonstrating that the company sales stream mainly comes from logistics of outdoors product lines. In constrast, CDs, Men's clothing, Toys contribute to sales the least. Regarding customer regions, sales are focused on Central America, Western Europe, and South America, while Central Asia, and East Africa generate the lowest sales.
3. The company generate the profit out of sales in dry season (Feb - June), and bottom down in Oct and Nov (rainy season). We also see that products with high discount rates are deemed to generate more profit margin.
4. Amongst the 4 shipment modes, First class, traditionally the prioritized mode to have goods delivered within 1 business day, has the smallest on-time shipment percentage, at around 2%, followed with the second class with only 37%. In overall, the average on-time shipment percentage of 4 shipment modes from 2015 - 2017 is only 52%, pretty low compared to normal level at other logistics companies.

### SCQ and Diagnostic Based Tree
---
| SCQ Framework  | Content |
| ------------- | ------------- |
| Situation  | The company annually performs well from Jan - June, where the most profits and sales come from the logistics of outdoors product categories (fishing, camping & hiking, and cleats) with the order quantity of 2-3 items and large discount rates.  |
| Complication  | The company sees a deep decline in order sales growth rate and profit margin during the Aug - Dec Period in 2017, with unsold products accounting for the majority of inventory cost, and high delayed shipment rates among the prioritized first-class and high-quantity second-class shipping modes. |
| Question  | What are drivers behind Just-In-Time deep decline of sales from Aug to Dec 2017? How can Just-In-Time recover its sales volume to 200,000 USD over the next 1 year? |










