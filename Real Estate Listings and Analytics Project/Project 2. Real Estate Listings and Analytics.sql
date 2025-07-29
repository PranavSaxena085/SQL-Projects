CREATE DATABASE Real_Estate_Listings_and_Analytics;

USE Real_Estate_Listings_and_Analytics;

-- CREATE TABLES --

CREATE TABLE Agents
(Agent_ID INT PRIMARY KEY AUTO_INCREMENT,
 Agent_Name VARCHAR(200),
 Email VARCHAR(100),
 Phone_Number VARCHAR(20),
 Agency_Name VARCHAR(100)
);

CREATE TABLE Properties 
(Property_ID INT PRIMARY KEY AUTO_INCREMENT, 
 Title VARCHAR(100),
 Address VARCHAR(250),
 City VARCHAR(100),
 Region VARCHAR(100),
 Price DECIMAL(12,2),
 Size_sqft INT,
 Property_Type VARCHAR(50),
 Listing_Date DATE,
 Agent_ID INT,
 
 FOREIGN KEY (Agent_ID) REFERENCES Agents(Agent_ID)
 );

CREATE TABLE Buyers
(Buyer_ID INT PRIMARY KEY AUTO_INCREMENT,
 Buyer_Name VARCHAR(100),
 Email VARCHAR(100),
 Phone_Number VARCHAR(20),
 Budget DECIMAL(12,2)
);

CREATE TABLE Transactions
(Transaction_ID INT PRIMARY KEY AUTO_INCREMENT,
 Property_ID INT,
 Buyer_ID INT,
 Agent_ID INT,
 Sales_Price DECIMAL(12,2),
 Transaction_Date DATE,
 
 FOREIGN KEY (Property_ID) REFERENCES Properties(Property_ID),
 FOREIGN KEY (Buyer_ID) REFERENCES Buyers(Buyer_ID),
 FOREIGN KEY (Agent_ID) REFERENCES Agents(Agent_ID)
);
 
-- INSERT RECORDS INTO TABLES --

INSERT INTO Agents (Agent_Name, Email, Phone_Number, Agency_Name) VALUES
('Ravi Sharma', 'ravi.sharma@homesindia.com', '9876543210', 'Homes India'),
('Pooja Mehta', 'pooja.mehta@urbanestate.in', '9823456789', 'Urban Estate'),
('Amit Verma', 'amit.verma@dreamhomes.com', '9812345678', 'Dream Homes'),
('Neha Joshi', 'neha.joshi@royalrealtors.com', '9845612378', 'Royal Realtors'),
('Suresh Patel', 'suresh.patel@maxspace.in', '9871234560', 'Max Space Realty'),
('Anjali Kapoor', 'anjali.kapoor@elitehomes.com', '9893456123', 'Elite Homes'),
('Manoj Desai', 'manoj.desai@proplines.in', '9834567123', 'PropLines'),
('Kavita Iyer', 'kavita.iyer@nestfinders.com', '9843214567', 'Nest Finders'),
('Rakesh Kumar', 'rakesh.kumar@primeprops.com', '9878765432', 'Prime Properties'),
('Divya Sinha', 'divya.sinha@homehunt.in', '9821782345', 'Home Hunt');

INSERT INTO Properties (Title, Address, City, Region, Price, Size_sqft, Property_Type, Listing_Date, Agent_ID) VALUES
('2BHK in Andheri West', 'A-12, Link Road, Andheri', 'Mumbai', 'Maharashtra', 9500000, 850, 'Apartment', '2024-12-01', 1),
('Luxury Villa in Whitefield', 'Plot 45, Whitefield', 'Bangalore', 'Karnataka', 25000000, 2500, 'Villa', '2025-01-15', 2),
('3BHK in Gachibowli', 'Flat 8B, Tower 3, Gachibowli', 'Hyderabad', 'Telangana', 12000000, 1350, 'Apartment', '2025-03-10', 3),
('Shop in Connaught Place', 'C-22, CP Block', 'Delhi', 'Delhi', 18000000, 600, 'Commercial', '2025-04-22', 4),
('Flat in Salt Lake', 'F-45, Sector 3', 'Kolkata', 'West Bengal', 7800000, 950, 'Apartment', '2025-05-05', 5),
('3BHK in Viman Nagar', 'B-10, Viman Nagar', 'Pune', 'Maharashtra', 8900000, 1100, 'Apartment', '2025-05-20', 6),
('Bungalow in Banjara Hills', 'H-19, Banjara Hills', 'Hyderabad', 'Telangana', 32000000, 2800, 'Villa', '2025-06-01', 7),
('Office Space in Sector 62', 'Plot 78, Sector 62', 'Noida', 'Uttar Pradesh', 14000000, 1500, 'Commercial', '2025-06-10', 8),
('1BHK in Kothrud', 'C-21, Kothrud', 'Pune', 'Maharashtra', 6200000, 600, 'Apartment', '2025-06-25', 9),
('Villa in ECR', 'V-5, East Coast Road', 'Chennai', 'Tamil Nadu', 27000000, 2400, 'Villa', '2025-07-05', 10);

INSERT INTO Buyers (Buyer_Name, Email, Phone_Number, Budget) VALUES
('Ankit Saxena', 'ankit.saxena@gmail.com', '9876541230', 10000000),
('Sneha Reddy', 'sneha.reddy@yahoo.com', '9823456781', 25000000),
('Rohan Mehra', 'rohan.mehra@outlook.com', '9812345672', 15000000),
('Meena Kumari', 'meena.kumari@gmail.com', '9845612379', 20000000),
('Devansh Gupta', 'dev.gupta@live.com', '9871234562', 8000000),
('Nidhi Sharma', 'nidhi.sharma@icloud.com', '9893456129', 9500000),
('Rajat Singh', 'rajat.singh@rediffmail.com', '9834567126', 14000000),
('Ishita Jain', 'ishita.jain@gmail.com', '9843214561', 12000000),
('Karan Arora', 'karan.arora@zoho.com', '9878765439', 7000000),
('Divya Rao', 'divya.rao@hotmail.com', '9821782390', 27000000);

INSERT INTO Transactions (Property_ID, Buyer_ID, Agent_ID, Sales_Price, Transaction_Date) VALUES
(1, 1, 1, 9200000, '2025-01-10'),
(2, 2, 2, 24000000, '2025-02-05'),
(3, 3, 3, 11800000, '2025-03-15'),
(4, 4, 4, 17500000, '2025-04-28'),
(5, 5, 5, 7600000, '2025-05-10'),
(6, 6, 6, 8700000, '2025-06-01'),
(7, 7, 7, 31000000, '2025-06-15'),
(8, 8, 8, 13800000, '2025-07-01'),
(9, 9, 9, 6000000, '2025-07-10'),
(10, 10, 10, 26000000, '2025-07-15');

-- Write queries to analyze average prices by region --

SELECT Region, ROUND(AVG(Price), 2) AS AVG_Price 
FROM Properties
GROUP BY Region;

-- Average Prices by Region – Highest to Lowest --
SELECT Region, ROUND(AVG(Price), 2) AS AVG_Price 
FROM Properties
GROUP BY Region
ORDER BY AVG(Price) DESC;						

-- Create views for high-demand areas --

CREATE VIEW High_Demand_Areas AS 
SELECT p.city, p.region,
       COUNT(t.Transaction_ID) AS Total_Transaction,
       ROUND(AVG(t.Sales_Price),2) AS AVG_Sales_Price
FROM properties as p
JOIN transactions as t
ON p.Property_ID = t.Property_ID
GROUP BY p.city, p.Region
HAVING COUNT(T.Transaction_ID) >= 2
ORDER BY AVG(t.Sales_Price);

SELECT * FROM High_Demand_Areas;

-- Generate price trend reports using window functions --

SELECT 
p.City,
p.Region,
t.Transaction_Date,
t.Sales_Price,
LAG(t.Sales_Price) OVER (PARTITION BY p.City ORDER BY t.Transaction_Date) AS Previous_Price,
LEAD(t.Sales_Price) OVER (PARTITION BY p.City ORDER BY t.Transaction_Date) AS Future_Price
FROM Properties AS p
JOIN Transactions AS t
ON p.Property_ID = t.Property_ID;

















