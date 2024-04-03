-- Create database
CREATE DATABASE online_shopping;
USE online_shopping;

-- Creating Customer Table
CREATE TABLE Customer (
    Customer_id INT IDENTITY(1,1) PRIMARY KEY,
    First_name VARCHAR(200) NOT NULL,
    Last_name VARCHAR(200) NOT NULL,
    Age INT NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Customer_password VARBINARY(64) NOT NULL,
    Gender VARCHAR(6) NOT NULL,
    Registration_date DATETIME DEFAULT GETDATE() NOT NULL
);

-- Creating Product Table
CREATE TABLE Product (
    Product_id INT IDENTITY(1,1) PRIMARY KEY,
    Product_name VARCHAR(50) NOT NULL,
    Product_description TEXT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Image_url VARCHAR(200),
    Quantity_in_stock INT NOT NULL,
    Category_id INT,
    Created_date DATETIME DEFAULT GETDATE() NOT NULL,
    FOREIGN KEY (Category_id) REFERENCES Category(Category_id) ON DELETE NO ACTION
);

-- Creating Review Table
CREATE TABLE Review (
    Review_id INT IDENTITY(1,1) PRIMARY KEY,
    Cust_id INT,
    Product_id INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5) NOT NULL,
    Review_description TEXT NOT NULL,
    Review_date DATETIME DEFAULT GETDATE() NOT NULL,
    FOREIGN KEY (Cust_id) REFERENCES Customer(Customer_id) ON DELETE CASCADE,
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id) ON DELETE CASCADE
);

-- Creating Cart Table
CREATE TABLE Cart (
    Cart_id INT IDENTITY(1,1) PRIMARY KEY,
    Cust_id INT,
    Product_id INT,
    Quantity INT NOT NULL,
    Date_added DATETIME DEFAULT GETDATE() NOT NULL,
    FOREIGN KEY (Cust_id) REFERENCES Customer(Customer_id) ON DELETE CASCADE,
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id) ON DELETE CASCADE
);

-- Creating Orders Table
CREATE TABLE Orders (
    Order_id INT IDENTITY(1,1) PRIMARY KEY,
    Cust_id INT,
    Shipment_id INT,
    Order_date DATETIME DEFAULT GETDATE() NOT NULL,
    Order_total INT NOT NULL,
    FOREIGN KEY (Cust_id) REFERENCES Customer(Customer_id) ON DELETE CASCADE,
    FOREIGN KEY (Shipment_id) REFERENCES Shipment(Shipment_id) ON DELETE CASCADE
);

-- Creating Order_item Table
CREATE TABLE Order_item (
    Order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    Order_id INT,
    Product_id INT,
    Quantity INT  NOT NULL,
    Item_total INT  NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id) ON DELETE CASCADE,
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id) ON DELETE CASCADE
);

-- Creating Payment Table
CREATE TABLE Payment (
    Payment_id INT IDENTITY(1,1) PRIMARY KEY,
    Order_id INT,
    Payment_method VARCHAR(50) NOT NULL,
    Amount INT NOT NULL,
    Payment_date DATETIME DEFAULT GETDATE() NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id) ON DELETE CASCADE
);

-- Creating Shipment Address Table
CREATE TABLE Shipment_address (
    Shipment_Address_id INT PRIMARY KEY,
    Shipment_country VARCHAR(255) NOT NULL,
    Shipment_city VARCHAR(255) NOT NULL,
    Postal_code VARCHAR(255) NOT NULL
);

-- Creating Shipment Table
CREATE TABLE Shipment (
    Shipment_id INT IDENTITY(1,1) PRIMARY KEY,
    Shipment_method VARCHAR(50) NOT NULL,
    Shipment_cost INT NOT NULL,
    Shipment_Address_id INT,
    FOREIGN KEY (Shipment_Address_id) REFERENCES Shipment_address(Shipment_Address_id) ON DELETE CASCADE
);

-- Creating Category Table
CREATE TABLE Category (
    Category_id INT IDENTITY(1,1) PRIMARY KEY,
    Category_name VARCHAR(200) NOT NULL
);




-- Inserting into Customer table with CONVERT function for password
INSERT INTO Customer (First_name, Last_name, Age, Email, Customer_password, Gender, Registration_date)
VALUES
('John', 'Doe', 25, 'john.doe@example.com', CONVERT(VARBINARY(64), 'password_hash1'), 'Male', GETDATE()),
('Jane', 'Smith', 30, 'jane.smith@example.com', CONVERT(VARBINARY(64), 'password_hash2'), 'Female', GETDATE()),
('Bob', 'Johnson', 28, 'bob.johnson@example.com', CONVERT(VARBINARY(64), 'password_hash3'), 'Male', GETDATE()),
('Alice', 'Williams', 35, 'alice.williams@example.com', CONVERT(VARBINARY(64), 'password_hash4'), 'Female', GETDATE()),
('Charlie', 'Brown', 22, 'charlie.brown@example.com', CONVERT(VARBINARY(64), 'password_hash5'), 'Male', GETDATE()),
('Eva', 'Miller', 29, 'eva.miller@example.com', CONVERT(VARBINARY(64), 'password_hash6'), 'Female', GETDATE()),
('David', 'Davis', 31, 'david.davis@example.com', CONVERT(VARBINARY(64), 'password_hash7'), 'Male', GETDATE()),
('Sophia', 'Johnson', 27, 'sophia.johnson@example.com', CONVERT(VARBINARY(64), 'password_hash8'), 'Female', GETDATE()),
('Michael', 'White', 32, 'michael.white@example.com', CONVERT(VARBINARY(64), 'password_hash9'), 'Male', GETDATE()),
('Emma', 'Anderson', 26, 'emma.anderson@example.com', CONVERT(VARBINARY(64), 'password_hash10'), 'Female', GETDATE()),
('Ryan', 'Wilson', 33, 'ryan.wilson@example.com', CONVERT(VARBINARY(64), 'password_hash11'), 'Male', GETDATE()),
('Olivia', 'Smith', 28, 'olivia.smith@example.com', CONVERT(VARBINARY(64), 'password_hash12'), 'Female', GETDATE()),
('Jacob', 'Taylor', 30, 'jacob.taylor@example.com', CONVERT(VARBINARY(64), 'password_hash13'), 'Male', GETDATE()),
('Sophie', 'Brown', 29, 'sophie.brown@example.com', CONVERT(VARBINARY(64), 'password_hash14'), 'Female', GETDATE()),
('William', 'Miller', 34, 'william.miller@example.com', CONVERT(VARBINARY(64), 'password_hash15'), 'Male', GETDATE()),
('Ava', 'Wilson', 27, 'ava.wilson@example.com', CONVERT(VARBINARY(64), 'password_hash16'), 'Female', GETDATE()),
('Ethan', 'Davis', 31, 'ethan.davis@example.com', CONVERT(VARBINARY(64), 'password_hash17'), 'Male', GETDATE()),
('Isabella', 'Johnson', 26, 'isabella.johnson@example.com', CONVERT(VARBINARY(64), 'password_hash18'), 'Female', GETDATE()),
('Mason', 'Anderson', 29, 'mason.anderson@example.com', CONVERT(VARBINARY(64), 'password_hash19'), 'Male', GETDATE()),
('Amelia', 'Smith', 30, 'amelia.smith@example.com', CONVERT(VARBINARY(64), 'password_hash20'), 'Female', GETDATE());


-- inserting to catagory table
INSERT INTO Category (Category_name)
VALUES
('Electronics'),
('Clothing'),
('Home and Garden');

-- Inserting into Product table
INSERT INTO Product (Product_name, Product_description, Price, Image_url, Quantity_in_stock, Category_id, Created_date)
VALUES
('Laptop', 'High-performance laptop with advanced features', 899.99, 'laptop_image.jpg', 50, 1, GETDATE()),
('Smartphone', 'Latest smartphone with cutting-edge technology', 699.99, 'smartphone_image.jpg', 100, 1, GETDATE()),
('LED TV', 'Ultra HD LED TV with vivid colors', 1199.99, 'tv_image.jpg', 30, 1, GETDATE()),
('Mens T-Shirt', 'Comfortable cotton T-shirt for men', 19.99, 'tshirt_image.jpg', 200, 2, GETDATE()),
('Womens Jeans', 'Stylish jeans for women', 49.99, 'jeans_image.jpg', 150, 2, GETDATE()),
('Coffee Maker', 'Automatic coffee maker for your daily brew', 59.99, 'coffeemaker_image.jpg', 20, 3, GETDATE()),
('Toaster', 'Stainless steel toaster for quick breakfasts', 39.99, 'toaster_image.jpg', 25, 3, GETDATE()),
('Gaming Mouse', 'High-precision gaming mouse for gamers', 49.99, 'mouse_image.jpg', 50, 1, GETDATE()),
('Running Shoes', 'Lightweight running shoes for fitness enthusiasts', 69.99, 'runningshoes_image.jpg', 75, 2, GETDATE()),
('Sofa Set', 'Modern and comfortable sofa set for your living room', 799.99, 'sofa_image.jpg', 10, 3, GETDATE()),
('Smart Watch', 'Fitness tracker and smartwatch with health features', 129.99, 'smartwatch_image.jpg', 30, 1, GETDATE()),
('Blender', 'Powerful blender for smoothies and shakes', 89.99, 'blender_image.jpg', 15, 3, GETDATE()),
('Office Chair', 'Ergonomic office chair for long hours of work', 129.99, 'officechair_image.jpg', 20, 3, GETDATE()),
('Backpack', 'Durable and spacious backpack for daily use', 39.99, 'backpack_image.jpg', 50, 2, GETDATE()),
('Desk Lamp', 'Adjustable desk lamp for focused work', 29.99, 'desklamp_image.jpg', 30, 3, GETDATE()),
('Wireless Headphones', 'Over-ear wireless headphones for immersive sound', 99.99, 'headphones_image.jpg', 40, 1, GETDATE()),
('Microwave Oven', 'Compact microwave oven for quick meals', 79.99, 'microwave_image.jpg', 15, 3, GETDATE()),
('Digital Camera', 'High-resolution digital camera for photography enthusiasts', 499.99, 'camera_image.jpg', 10, 1, GETDATE()),
('Printed Bed Sheets', 'Soft and stylish bed sheets with vibrant prints', 29.99, 'bedsheets_image.jpg', 60, 3, GETDATE()),
('Fitness Tracker', 'Track your fitness goals with this advanced tracker', 59.99, 'fitnesstracker_image.jpg', 35, 2, GETDATE());

-- Inserting into Review table
INSERT INTO Review (Cust_id, Product_id, Rating, Review_description, Review_date)
VALUES
(1, 1, 5, 'Great laptop! Powerful and fast.', GETDATE()),
(2, 3, 4, 'The LED TV has excellent picture quality.', GETDATE()),
(3, 5, 3, 'Good quality T-shirt but a bit expensive.', GETDATE()),
(4, 7, 5, 'Love the coffee maker! Makes delicious coffee.', GETDATE()),
(5, 9, 2, 'Not satisfied with the gaming mouse. Unresponsive.', GETDATE()),
(6, 12, 4, 'The smartwatch is fantastic! Highly recommended.', GETDATE()),
(7, 15, 5, 'Wireless headphones have great sound quality.', GETDATE());

-- Inserting into Cart table
INSERT INTO Cart (Cust_id, Product_id, Quantity, Date_added)
VALUES
(1, 3, 2, GETDATE()),
(2, 8, 1, GETDATE()),
(3, 12, 3, GETDATE()),
(4, 5, 1, GETDATE()),
(5, 10, 2, GETDATE()),
(6, 15, 1, GETDATE()),
(7, 2, 4, GETDATE());


-- Inserting into Shipment_address table
INSERT INTO Shipment_address (Shipment_Address_id, Shipment_country, Shipment_city, Postal_code)
VALUES
(1, 'United States', 'New York', '10001'),
(2, 'Canada', 'Toronto', 'M5A 1A1'),
(3, 'United Kingdom', 'London', 'SW1A 1AA'),
(4, 'Australia', 'Sydney', '2000'),
(5, 'Germany', 'Berlin', '10117'),
(6, 'France', 'Paris', '75001'),
(7, 'Japan', 'Tokyo', '100-0001');

-- Inserting into Shipment table
INSERT INTO Shipment (Shipment_method, Shipment_cost, Shipment_Address_id)
VALUES
('Standard Shipping', 9.99, 1),
('Express Shipping', 19.99, 2),
('International Shipping', 29.99, 3),
('Local Delivery', 14.99, 4),
('Two-Day Shipping', 24.99, 5),
('Next-Day Shipping', 34.99, 6),
('Priority Mail', 12.99, 7);

-- Inserting into Orders table
INSERT INTO Orders (Cust_id, Shipment_id, Order_date, Order_total)
VALUES
(1, 1, GETDATE(), 120.50),
(2, 2, GETDATE(), 75.99),
(3, 3, GETDATE(), 200.25),
(4, 4, GETDATE(), 50.00),
(5, 5, GETDATE(), 180.75),
(6, 6, GETDATE(), 90.49),
(7, 7, GETDATE(), 150.00);

-- Inserting into Payment table
INSERT INTO Payment (Order_id, Payment_method, Amount, Payment_date)
VALUES
(1, 'Credit Card', 120.50, GETDATE()),
(2, 'PayPal', 75.99, GETDATE()),
(3, 'Bank Transfer', 200.25, GETDATE()),
(4, 'Cash on Delivery', 50.00, GETDATE()),
(5, 'Credit Card', 180.75, GETDATE()),
(6, 'PayPal', 90.49, GETDATE()),
(7, 'Credit Card', 150.00, GETDATE());

/*inserting in to orderitem table*/
INSERT INTO Order_item (Order_id, Product_id, Quantity, Item_total)
VALUES
(1, 3, 2, 30.50),
(2, 8, 1, 15.99),
(3, 12, 3, 60.75),
(4, 5, 1, 25.00),
(5, 10, 2, 90.25),
(6, 15, 1, 45.49),
(7, 2, 4, 60.00);



-- SQL SELECT DISTINCT Statement
-- Retrieve distinct product categories
SELECT DISTINCT Category_name
FROM Category;

-- SQL ORDER BY
-- Retrieve customer information ordered by registration date in descending order
SELECT *
FROM Customer
ORDER BY Registration_date DESC;

-- SQL GROUP BY Statement
-- Count the number of reviews for each product
SELECT Product_id, COUNT(Review_id) AS ReviewCount
FROM Review
GROUP BY Product_id;

-- SQL HAVING Clause
-- Retrieve products with an average rating greater than 3
SELECT Product_id, AVG(Rating) AS AvgRating
FROM Review
GROUP BY Product_id
HAVING AVG(Rating) > 3;

-- SQL LIKE Operator
-- Find customers with email addresses containing "example"
SELECT *
FROM Customer
WHERE Email LIKE '%example%';

-- The _ Wildcard
-- Retrieve products with names starting with "Sofa"
SELECT *
FROM Product
WHERE Product_name LIKE 'Sofa%';

-- SQL BETWEEN Operator
-- Retrieve products with prices between $50 and $100
SELECT *
FROM Product
WHERE Price BETWEEN 50 AND 100;

-- NOT BETWEEN
-- Retrieve products with prices not between $50 and $100
SELECT *
FROM Product
WHERE Price NOT BETWEEN 50 AND 100;

-- BETWEEN with IN
-- Retrieve products with prices between $50 and $100 or $200 and $300
SELECT *
FROM Product
WHERE Price BETWEEN 50 AND 100 OR Price BETWEEN 200 AND 300;

-- NOT BETWEEN Text Values
-- Retrieve products with names not starting with 'Sofa'
SELECT *
FROM Product
WHERE Product_name NOT LIKE 'Sofa%';

-- SQL ANY and ALL Operators
-- Retrieve products with a price greater than any product in the 'Electronics' category
SELECT *
FROM Product
WHERE Price > ANY (SELECT Price FROM Product WHERE Category_id = 1);

-- SQL CASE Expression
-- Assign a category label based on the product price
SELECT Product_id, Product_name,
  CASE
    WHEN Price < 50 THEN 'Low Range'
    WHEN Price BETWEEN 50 AND 100 THEN 'Mid Range'
    WHEN Price > 100 THEN 'High Range'
  END AS PriceCategory
FROM Product;


-- Complex Join
-- Corrected SQL JOIN Statement
SELECT Customer.First_name, Product.Product_name
FROM Customer
JOIN Orders ON Customer.Customer_id = Orders.Cust_id
JOIN Order_item ON Orders.Order_id = Order_item.Order_id
JOIN Product ON Order_item.Product_id = Product.Product_id;


-- Subquery
SELECT Product_name
FROM Product
WHERE Product_id IN (SELECT Product_id FROM Order_item WHERE Quantity > 2);

-- Aggregate Function
SELECT AVG(Rating) AS AvgRating
FROM Review;


-- Comprehensive Scenario of Transactions

-- (Assuming an order transaction scenario)
BEGIN TRANSACTION;

UPDATE Product
SET Quantity_in_stock = Quantity_in_stock - 1
WHERE Product_id = '1';
COMMIT;

-- Transaction 2: Debit the buyer (customer)
BEGIN TRANSACTION;

DECLARE @CustomerID INT = 1;
DECLARE @ProductPrice DECIMAL(10, 2) = 899.99;

UPDATE Customer
SET Amount = Amount - @ProductPrice
WHERE Customer_id = @CustomerID;

-- Commit the second transaction
COMMIT;





-- Views, Procedures, and Triggers

-- Example View: Retrieve order details with customer and product information
CREATE VIEW OrderDetails AS
SELECT
    o.Order_id,
    c.First_name + ' ' + c.Last_name AS CustomerName,
    p.Product_name,
    oi.Quantity,
    oi.Item_total
FROM Orders o
JOIN Customer c ON o.Cust_id = c.Customer_id
JOIN Order_item oi ON o.Order_id = oi.Order_id
JOIN Product p ON oi.Product_id = p.Product_id;



-- Example Procedure: Get order total by order ID
CREATE PROCEDURE GetOrderTotal(@OrderID INT)
AS
BEGIN
    SELECT Order_total
    FROM Orders
    WHERE Order_id = @OrderID;
END;

-- Procedure to get average rating for a product
CREATE PROCEDURE GetAverageRatingForProduct(@ProductID INT)
AS
BEGIN
    SELECT AVG(Rating) AS AvgRating
    FROM Review
    WHERE Product_id = @ProductID;
END;


-- Example Trigger: Log changes to the Review table
CREATE TRIGGER LogReviewChanges
ON Review
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Log Inserted Data
    IF EXISTS (SELECT * FROM INSERTED)
    BEGIN
        INSERT INTO ReviewLog (ActionType, Cust_id, Product_id, Rating, Review_description, Review_date)
        SELECT 'INSERT', Cust_id, Product_id, Rating, Review_description, Review_date
        FROM INSERTED;
    END

    -- Log Updated Data
    IF EXISTS (SELECT * FROM DELETED)
    BEGIN
        INSERT INTO ReviewLog (ActionType, Cust_id, Product_id, Rating, Review_description, Review_date)
        SELECT 'UPDATE', Cust_id, Product_id, Rating, Review_description, Review_date
        FROM DELETED;
    END

    -- Log Deleted Data
    IF EXISTS (SELECT * FROM DELETED)
    BEGIN
        INSERT INTO ReviewLog (ActionType, Cust_id, Product_id, Rating, Review_description, Review_date)
        SELECT 'DELETE', Cust_id, Product_id, Rating, Review_description, Review_date
        FROM DELETED;
    END
END;


--SEQURITY ACCSESS CONTROL

-- Create roles
CREATE ROLE SalesTeam;
CREATE ROLE InventoryTeam;
CREATE ROLE CustomerSupportTeam;
CREATE ROLE Admin;

-- Create users
CREATE USER SalesUser WITHOUT LOGIN;
CREATE USER InventoryUser WITHOUT LOGIN;
CREATE USER CustomerSupportUser WITHOUT LOGIN;
CREATE USER AdminUser WITHOUT LOGIN;

-- Assign users to roles
ALTER ROLE SalesTeam ADD MEMBER SalesUser;
ALTER ROLE InventoryTeam ADD MEMBER InventoryUser;
ALTER ROLE CustomerSupportTeam ADD MEMBER CustomerSupportUser;
ALTER ROLE Admin ADD MEMBER AdminUser;


-- Granting Permissions

GRANT SELECT, INSERT, UPDATE, DELETE ON Customer TO SalesTeam;

GRANT SELECT, UPDATE ON Product TO InventoryTeam;

GRANT SELECT ON Review TO CustomerSupportUser;

GRANT SELECT ON ProductReview_Detail TO Admin;

GRANT SELECT ON OrderDetail TO Admin;

GRANT EXECUTE ON LogReviewChanges TO Admin;

GRANT INSERT, UPDATE, DELETE ON ReviewLog TO Admin;


-- REVOKE INSERT ON Customer FROM SalesTeam;


