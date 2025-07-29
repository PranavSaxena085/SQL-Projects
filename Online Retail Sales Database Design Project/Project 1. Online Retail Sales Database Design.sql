CREATE DATABASE Online_Retail_Sales_Database_Design;
USE Online_Retail_Sales_Database_Design;

-- CREATE TABLES --

CREATE TABLE Products 
  (Product_ID INT PRIMARY KEY AUTO_INCREMENT,
   Product_Name VARCHAR(100),
   Price DECIMAL(10,2),
   Product_Quantity INT);
  
CREATE TABLE Customer
  (Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
   Customer_Name VARCHAR(100),
   Email VARCHAR(200),
   Address VARCHAR(200));

CREATE TABLE Orders
  (Order_ID INT PRIMARY KEY AUTO_INCREMENT,
   Customer_ID INT,
   Order_Date DATE,
   Total_Amount DECIMAL(10,2),
   FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID));

CREATE TABLE OrderDetails
  (Order_Details_ID INT PRIMARY KEY AUTO_INCREMENT,
   Order_ID INT,
   Product_ID INT,
   Quantity INT,
   Unit_Price DECIMAL(10,2),
   FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
   FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
   );
   
CREATE TABLE payment
  (Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
   Order_ID INT,
   Payment_Date DATE,
   Payment_Mode VARCHAR(100),
   FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID));
   
-- INSERT RECORDS INTO TABLES --
   
INSERT INTO Products (Product_Name, Price, Product_Quantity) VALUES
('Wireless Mouse', 599.00, 50),
('Bluetooth Headphones', 1299.00, 40),
('Laptop Stand', 899.00, 25),
('USB-C Cable', 299.00, 100),
('Mechanical Keyboard', 1999.00, 30),
('Webcam HD', 1499.00, 20),
('Portable SSD 1TB', 5999.00, 15),
('Gaming Monitor', 12999.00, 10),
('Smartwatch', 3499.00, 22),
('Wireless Charger', 799.00, 35),
('Bluetooth Speaker', 2499.00, 18),
('Ergonomic Chair', 8499.00, 8),
('Graphic Tablet', 3999.00, 12),
('Noise Cancelling Headphones', 7999.00, 9),
('LED Desk Lamp', 499.00, 28);

INSERT INTO Customer (Customer_Name, Email, Address) VALUES
('Amit Sharma', 'amit.sharma@example.com', 'Delhi, India'),
('Priya Singh', 'priya.singh@example.com', 'Mumbai, India'),
('Rahul Verma', 'rahul.verma@example.com', 'Bangalore, India'),
('Sneha Patel', 'sneha.patel@example.com', 'Ahmedabad, India'),
('Karan Mehta', 'karan.mehta@example.com', 'Chandigarh, India'),
('Ritu Kapoor', 'ritu.kapoor@example.com', 'Pune, India'),
('Mohit Yadav', 'mohit.yadav@example.com', 'Jaipur, India'),
('Anjali Nair', 'anjali.nair@example.com', 'Kochi, India'),
('Rakesh Gupta', 'rakesh.gupta@example.com', 'Lucknow, India'),
('Neha Chauhan', 'neha.chauhan@example.com', 'Bhopal, India'),
('Vikram Joshi', 'vikram.joshi@example.com', 'Hyderabad, India'),
('Divya Rani', 'divya.rani@example.com', 'Patna, India'),
('Saurabh Rao', 'saurabh.rao@example.com', 'Nagpur, India'),
('Pooja Malhotra', 'pooja.malhotra@example.com', 'Noida, India'),
('Nikhil Dubey', 'nikhil.dubey@example.com', 'Indore, India');

INSERT INTO Orders (Customer_ID, Order_Date, Total_Amount) VALUES
(1, '2025-07-01', 1898.00),
(2, '2025-07-02', 2999.00),
(3, '2025-07-03', 8499.00),
(4, '2025-07-03', 1198.00),
(5, '2025-07-04', 1499.00),
(6, '2025-07-05', 499.00),
(7, '2025-07-05', 12999.00),
(8, '2025-07-06', 2499.00),
(9, '2025-07-06', 1999.00),
(10, '2025-07-07', 599.00),
(11, '2025-07-08', 3499.00),
(12, '2025-07-08', 1998.00),
(13, '2025-07-09', 2798.00),
(14, '2025-07-09', 299.00),
(15, '2025-07-10', 15998.00);

INSERT INTO OrderDetails (Order_ID, Product_ID, Quantity, Unit_Price) VALUES
(1, 1, 2, 599.00),
(2, 2, 1, 1299.00),
(3, 12, 1, 8499.00),
(4, 4, 4, 299.00),
(5, 6, 1, 1499.00),
(6, 15, 1, 499.00),
(7, 8, 1, 12999.00),
(8, 11, 1, 2499.00),
(9, 5, 1, 1999.00),
(10, 1, 1, 599.00),
(11, 9, 1, 3499.00),
(12, 4, 2, 299.00),
(13, 10, 2, 1399.00),
(14, 4, 1, 299.00),
(15, 14, 2, 7999.00);

INSERT INTO payment (Order_ID, Payment_Date, Payment_Mode) VALUES
(1, '2025-07-01', 'UPI'),
(2, '2025-07-02', 'Credit Card'),
(3, '2025-07-03', 'Cash on Delivery'),
(4, '2025-07-03', 'UPI'),
(5, '2025-07-04', 'Debit Card'),
(6, '2025-07-05', 'UPI'),
(7, '2025-07-05', 'Credit Card'),
(8, '2025-07-06', 'Net Banking'),
(9, '2025-07-06', 'Cash on Delivery'),
(10, '2025-07-07', 'UPI'),
(11, '2025-07-08', 'UPI'),
(12, '2025-07-08', 'Credit Card'),
(13, '2025-07-09', 'Debit Card'),
(14, '2025-07-09', 'UPI'),
(15, '2025-07-10', 'Net Banking');

SELECT * FROM products;
SELECT * FROM customer;
SELECT * FROM orderdetails;
SELECT * FROM Orders;
SELECT * FROM payment;

-- USE JOINS --

-- Customer-Wise Order Query
SELECT c.Customer_ID, c.Customer_Name, c.Email, c.Address, o.Order_Date, o.Total_Amount
FROM customer as c
JOIN Orders as o
ON c.Customer_ID = o.Customer_ID;

-- Product-wise sales
SELECT p.Product_ID, p.Product_Name, SUM(od.Quantity) AS TOTAL_UNIT_SOLD, SUM(od.Unit_Price * od.Quantity) AS TOTAL_SALES_AMOUNT
FROM products as p
JOIN orderdetails as od
ON p.Product_ID = od.Product_ID
GROUP BY p.Product_ID, p.Product_Name;

-- Payment summaries
SELECT o.Order_ID, py.Payment_ID, o.Order_Date, py.Payment_Date, py.Payment_Mode
FROM Orders as o
JOIN payment as py
ON o.Order_ID = py.Order_ID;

-- Top 3 Best-Selling Products
SELECT p.Product_Name, SUM(od.Quantity) AS Units_Sold
FROM products as p
JOIN orderdetails as od
ON p.Product_ID = od.Product_ID
GROUP BY p.Product_Name
ORDER BY Units_Sold DESC
LIMIT 3;

-- Monthly Revenue Report
SELECT MONTH(Order_Date) as Months, SUM(Total_Amount) AS Revenue
FROM Orders
GROUP BY MONTH(Order_Date); 

-- Customer Payment Details
SELECT c.Customer_Name, o.Order_ID, p.Payment_Mode, p.Payment_Date, o.Total_Amount
FROM Customer c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Payment p ON o.Order_ID = p.Order_ID;

-- CREATE VIEW -- 

CREATE VIEW  Top_3_Best_Selling_Products AS 
SELECT p.Product_Name, SUM(od.Quantity) AS Units_Sold
FROM products as p
JOIN orderdetails as od
ON p.Product_ID = od.Product_ID
GROUP BY p.Product_Name
ORDER BY Units_Sold DESC
LIMIT 3;

CREATE VIEW CustomerOrders AS
SELECT c.Customer_ID, c.Customer_Name, o.Order_ID, o.Order_Date, o.Total_Amount
FROM customer AS c
JOIN Orders AS o ON c.Customer_ID = o.Customer_ID;

CREATE VIEW High_Value_Orders AS
SELECT p.Product_Name, SUM(od.Quantity) AS Total_Unit_Sold, SUM(od.Unit_Price * od.Quantity) AS Total_Value
FROM products as p
JOIN orderdetails as od
ON p.Product_ID = od.Product_ID
GROUP BY p.Product_Name;


