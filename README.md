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

### Problem and Root Cause Identification
---
#### SCQ
| SCQ Framework  | Content |
| ------------- | ------------- |
| Situation  | The company annually performs well from Jan - June, where the most profits and sales come from the logistics of outdoors product categories (fishing, camping & hiking, and cleats) with the order quantity of 2-3 items and large discount rates.  |
| Complication  | The company sees a deep decline in order sales growth rate and profit margin during the Aug - Dec Period in 2017, with unsold products accounting for the majority of inventory cost, and high delayed shipment rates among the prioritized first-class and high-quantity second-class shipping modes. |
| Question  | What are drivers behind Just-In-Time deep decline of sales from Aug to Dec 2017? How can Just-In-Time recover its sales volume to 200,000 USD over the next 1 year? |

#### Diagnostic Based Tree
![image](https://github.com/user-attachments/assets/bc2d8e60-823d-4de6-88e3-40aee8471382)

Hypotheses:
1) Customers change their product preferences while the company does not respond quickly to demand conversion, leading to less orders being made.	
2) The more delayed the shipments in regard of delivery modes, the the lesser the number of orders.
3) Lack of product supplies to fulfill the orders.
4) Increasing discount rate decreases the business profit.  	
5) There are products with high-quantity inventory or/and high inventor cost per unt but are not sellable.

### Hypothesis Testing
---
**H1: Customers change their product preferences while the company does not respond quickly to demand conversion, leading to less orders being made.**
![image](https://github.com/user-attachments/assets/e2c4a44a-b941-4316-a7c8-ebe51973c2c1)
![image](https://github.com/user-attachments/assets/b35599ff-2296-4b47-955d-2fb67cb77c3e)
Comment:
* There is a sharp decrease of around 1,200 orders (82%) from Sep to Oct 2017, and is maintained at around 250 monthly orders for the rest of the period.
* These are 5 products that are not of customer preferences. Despite slight increase of inventory for each of 5 above products, there are less or no change of orders being made for those. 
* However, the order quantity of these products are two low to demonstrate that customers have changed their overall preferences.
=> Therefore, the (H1) hypothesis that company does not respond quickly to change in customers' preference ***is rejected.***

**H2: The more delayed the shipments in regard of delivery modes, the lesser the number of orders.**
![image](https://github.com/user-attachments/assets/2ebd0d16-0ed7-4a88-bbf2-e3f253881170)
![image](https://github.com/user-attachments/assets/40ac8f6d-f64c-4257-84ac-54cf9b437868)
![image](https://github.com/user-attachments/assets/2d2a9ac2-aa91-4ecf-a7b6-999b5b4ee88e)
![image](https://github.com/user-attachments/assets/926dee8f-44b8-4f3e-85ca-a9a3c5327a92)
Comment:
* Even though the on-time shipping rate of first-class shipment mode is very low, at 2%, there is no correlation between late shipment and the number of orders. 
* We can clearly see that the higher the late shipment rate in regards of second-class shipment rate, the lower the number of orders being made.
=> Therefore, H2 is **partially accepted** when refers to second-class shipment mode only.

**H3: Suppliers do not provide sufficient products for the company to fulfill the orders**
![image](https://github.com/user-attachments/assets/f52c831d-9879-4dd7-8d1a-8fa544d894e0)
![image](https://github.com/user-attachments/assets/7efb18e5-8750-4b5d-a76a-0d712ee5e5a2)
![image](https://github.com/user-attachments/assets/01a743f7-9857-4785-a0ec-132c09329a8b)
Coment:
* There is a positive correlation between warehouse inventory and oder quantity. Also, both exert the same trends from 2015 - 2017.
* We can conclude that our loss of orders is consituted by the insuficiency of product supplies.
=> H3 is **supported**

**H4: Increasing discount rate will generate less profit**
![image](https://github.com/user-attachments/assets/1d4855e9-a52e-4b29-9dad-b397fcc82848)
**Comment:**
* As company giving high discount rate for their service, they can generate more profit on each service given.
* When certain products in the inventory become obsolete or slow-moving, the company can issue high discount rate for these products to enhance their sales volume, thereby increasing the profit.
=> H4 is **not supported.**

**H5: There are products with high-quantity inventory or/and high inventory cost per unit but are not sellable.**
![image](https://github.com/user-attachments/assets/1bf56a8d-2a91-4c61-8dbf-a69ddf0123ab)
![image](https://github.com/user-attachments/assets/e1cf481e-7551-4324-a408-cd61accf6329)

Comment: There are 4 products that are unsellable. More importantly, 2 of them accounts for the majority of inventory costs from 2015 - 2017. 
=> H5 is **accepted**.

**Hypothesis Testing Result Summary**
| Hypothesis | Result |
| ------------- | ------------- |
| H1: Customers change their product preferences while the company does not respond quickly to demand conversion, leading to less orders being made.  | Not supported  |
| H2: The more delayed the shipments in regard of delivery modes, the lesser the number of orders. | Partially supported (second-class mode) |
| H3: Suppliers do not provide sufficient products for the company to fulfill the orders  | Supported |
| H4: Increasing discount rate will generate less profit | Not supported |
| H5: There are products with high-quantity inventory or/and high inventory cost per unit but are not sellable. | Supported |

### Recommendations
---









