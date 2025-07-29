🛒 Online Retail Sales Database Design Project
Introduction
This project involves designing a normalized relational database system for an online retail sales platform. The objective is to efficiently manage and analyze data related to products, customers, orders, and payments using MySQL. The system enables business reporting and provides insights into sales performance.

Tools Used
Database System: MySQL
ER Diagram Tool: MySQL Workbench
Platform: MySQL Workbench + GitHub
Database Schema Overview
The database consists of the following five main tables:

🔹 Customer
Stores buyer information.

Customer_ID (Primary Key)
Customer_Name
Email
Address
🔹 Products
Stores product details and inventory.

Product_ID (Primary Key)
Product_Name
Price
Product_Quantity
🔹 Orders
Captures customer purchase transactions.

Order_ID (Primary Key)
Customer_ID (Foreign Key referencing Customer)
Order_Date
Total_Amount
🔹 OrderDetails
Maps products to each order with quantity and price details.

Order_Details_ID (Primary Key)
Order_ID (Foreign Key referencing Orders)
Product_ID (Foreign Key referencing Products)
Quantity
Unit_Price
🔹 Payment
Tracks payments made for each order.

Payment_ID (Primary Key)
Order_ID (Foreign Key referencing Orders)
Payment_Date
Payment_Mode
The database is normalized to Third Normal Form (3NF) to ensure data consistency and avoid redundancy.

Sample Data
Each table is populated with realistic mock data to simulate real-world business transactions such as product purchases, customer orders, and payments.
I used ChatGPT to generate sample records for the tables.

Key Queries and Reports
The project includes several useful SQL queries, such as:

Customer-wise Orders: Retrieve order history for each customer.
Product-wise Sales: Analyze units sold and total sales amount per product.
Payment Summaries: Display payment mode and date for each order.
Top 3 Best-Selling Products: Find most sold products based on quantity.
Monthly Revenue Report: Aggregate monthly sales revenue.
Customer Payment Details: Combine customer, order, and payment info.
Queries utilize:

JOIN
GROUP BY
Aggregate functions (SUM, COUNT)
ORDER BY
LIMIT
Views Created
To simplify frequent reporting, the following SQL views are created:

Top_3_Best_Selling_Products – Lists the top 3 most sold products by unit.
CustomerOrders – Shows each customer’s order details.
High_Value_Orders – Highlights product-wise sales volume and value.
✅ Project Features
Fully normalized database (3NF)
Realistic business use-case simulation
Clean SQL code with joins and views
Scalable foundation for dashboards or applications
Conclusion
This project demonstrates a complete MySQL-based database design workflow—from schema creation and normalization to query writing and reporting. It forms a solid base for future enhancements like analytics dashboards, frontend integration, or data visualization using tools like Power BI or Tableau.
