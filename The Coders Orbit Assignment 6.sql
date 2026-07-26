CREATE DATABASE RetailMartDB;
USE RetailMartDB;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    city VARCHAR(50),
    created_at DATE
);
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    unit_price DECIMAL(10,2),
    stock_qty INT
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(20),
    channel VARCHAR(20),
    city VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_pct DECIMAL(5,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
ALTER TABLE customers
ADD gender VARCHAR(10);
ALTER TABLE customers
RENAME COLUMN phone TO mobile_no;
ALTER TABLE customers
MODIFY email VARCHAR(255);
ALTER TABLE products
DROP COLUMN stock_qty;
ALTER TABLE orders
RENAME TO customer_orders;
DROP TABLE order_items;
DROP DATABASE RetailMartDB;
CREATE DATABASE RetailMartDB;
USE RetailMartDB;
DROP TABLE customers;
CREATE TABLE customers(
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(100),
  mobile_no VARCHAR(15),
  email VARCHAR(100),
  city VARCHAR(50),
  created_at DATE,
  gender VARCHAR(10)
);
INSERT INTO customers(full_name, mobile_no, email, city, created_at, gender)
VALUES 
('Amit Patil','9876543210','amit@gmail.com','Pune','2026-01-01','Male'),
('Sneha Bane','9876543211','sneha@gmail.com','Mumbai','2026-01-02','Female'),
('Rahul Joshi','9876543212','rahul@gmail.com','Nashik','2026-01-03','Male'),
('Priya Desai','9876543213','priya@gmail.com','Nagpur','2026-01-04','Female'),
('Rohit More','9876543214','rohit@gmail.com','Pune','2026-01-05','Male'),
('Neha Ghadge','9876543215','neha@gmail.com','Thane','2026-01-06','Female'),
('Sagar Pawar','9876543216','sagar@gmail.com','Kolhapur','2026-01-07','Male'),
('Pooja Pawar','9876543217','pooja@gmail.com','Aurangabad','2026-01-08','Female'),
('Kiran Jadhav','9876543218','kiran@gmail.com','Solapur','2026-01-09','Male'),
('Anjali Bhoge','9876543219','anjali@gmail.com','Pune','2026-01-10','Female');
CREATE TABLE products(
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(100),
  category VARCHAR(50),
  brand VARCHAR(50),
  unit_price DECIMAL(10,2)
);

INSERT INTO products (product_name, category, brand, unit_price)
VALUES 
('Laptop', 'Electronics', 'Dell', 65000),
('Smartphone', 'Electronics', 'Samsung', 25000),
('Headphones', 'Electronics', 'Sony', 3000),
('Refrigerator', 'Appliances', 'LG', 45000),
('Washing Machine', 'Appliances', 'Samsung', 38000),
('Microwave Oven', 'Appliances', 'LG', 12000),
('Office Chair', 'Furniture', 'Godrej', 5500),
('Study Table', 'Furniture', 'Godrej', 8500),
('Bookshelf', 'Furniture', 'Durian', 7000),
('Running Shoes', 'Footwear', 'Nike', 4500),
('Sports Shoes', 'Footwear', 'Adidas', 6000),
('Sandals', 'Footwear', 'Bata', 1500);
CREATE TABLE customer_orders(
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  order_date DATE,
  order_status VARCHAR(20),
  channel VARCHAR(10),
  city VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customer_orders (order_id, customer_id, order_date, order_status, channel, city)
VALUES 
(1, 1, '2026-01-02', 'DELIVERED', 'ONLINE', 'Pune'),
(2, 2, '2026-01-03', 'PENDING', 'OFFLINE', 'Mumbai'),
(3, 3, '2026-01-05', 'SHIPPED', 'ONLINE', 'Nashik'),
(4, 4, '2026-01-06', 'CANCELLED', 'ONLINE', 'Nagpur'),
(5, 5, '2026-01-08', 'DELIVERED', 'OFFLINE', 'Pune'),
(6, 6, '2026-01-10', 'PENDING', 'ONLINE', 'Thane'),
(7, 7, '2026-01-12', 'SHIPPED', 'ONLINE', 'Kolhapur'),
(8, 8, '2026-01-14', 'DELIVERED', 'OFFLINE', 'Aurangabad'),
(9, 9, '2026-01-16', 'CANCELLED', 'ONLINE', 'Solapur'),
(10, 10, '2026-01-18', 'DELIVERED', 'ONLINE', 'Pune'),
(11, 1, '2026-01-20', 'PENDING', 'OFFLINE', 'Pune'),
(12, 2, '2026-01-22', 'SHIPPED', 'ONLINE', 'Mumbai'),
(13, 3, '2026-01-24', 'DELIVERED', 'ONLINE', 'Nashik'),
(14, 4, '2026-01-26', 'PENDING', 'OFFLINE', 'Nagpur'),
(15, 5, '2026-01-28', 'DELIVERED', 'ONLINE', 'Pune');
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_pct DECIMAL(5,2),
    FOREIGN KEY (order_id) REFERENCES customer_orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

USE RetailMartDB;
SHOW TABLES;
INSERT INTO order_items
(order_id, product_id, quantity, unit_price, discount_pct)
VALUES
(1,1,1,55000,10),
(1,3,2,1500,5),
(2,2,1,22000,8),
(2,5,3,1200,0),
(3,4,2,3500,10),
(3,6,1,2500,5),
(4,7,5,1200,2),
(4,8,2,1800,0),
(5,9,10,60,0),
(5,10,1,3200,15),
(6,11,1,5500,10),
(6,12,1,25000,20),
(7,1,1,55000,5),
(7,2,2,22000,10),
(8,3,3,1500,0),
(8,4,1,3500,5),
(9,5,4,1200,10),
(9,6,2,2500,8),
(10,7,3,1200,0),
(10,8,2,1800,5),
(11,9,5,60,0),
(11,10,1,3200,10),
(12,11,2,5500,5),
(12,12,1,25000,15),
(13,1,1,55000,10),
(13,2,1,22000,0),
(14,3,2,1500,5),
(14,4,2,3500,10),
(15,5,3,1200,0),
(15,6,2,2500,5),
(1,7,4,1200,2),
(2,8,3,1800,5),
(3,9,8,60,0),
(4,10,1,3200,10),
(5,11,2,5500,8),
(6,12,1,25000,15),
(7,3,2,1500,5),
(8,5,2,1200,0),
(9,7,5,1200,3),
(10,2,1,22000,7);

USE RetailMartDB;
UPDATE customers
SET city = 'Pune'
WHERE customer_id = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE products
SET unit_price = unit_price * 1.08
WHERE category = 'Electronics';
DELETE FROM customer_orders
WHERE order_status = 'CANCELLED';
DELETE FROM customers
WHERE customer_id = 10;
SELECT *
FROM customers
WHERE city = 'Pune';
SELECT *
FROM products
WHERE unit_price > 2000;
SELECT *
FROM customer_orders
WHERE channel = 'ONLINE';
SELECT *
FROM customer_orders
WHERE order_date BETWEEN '2026-01-01' AND '2026-01-31';
SELECT *
FROM products
WHERE unit_price BETWEEN 500 AND 1500;
SELECT *
FROM order_items
WHERE quantity BETWEEN 2 AND 6;
SELECT DISTINCT city
FROM customers;
SELECT DISTINCT category
FROM products;
SELECT *
FROM products
ORDER BY unit_price DESC;
SELECT *
FROM customers
ORDER BY created_at DESC;
SELECT *
FROM customer_orders
ORDER BY order_date ASC, order_status ASC;
SELECT city, COUNT(*) AS total_orders
FROM customer_orders
GROUP BY city;
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;
SELECT category, AVG(unit_price) AS avg_price
FROM products
GROUP BY category;
SELECT order_id,
SUM(quantity * unit_price * (1 - discount_pct / 100)) AS total_revenue
FROM order_items
GROUP BY order_id;
SELECT p.category,
SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category;
SELECT p.product_name,
SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name;
SELECT city, COUNT(*) AS total_orders
FROM customer_orders
GROUP BY city
HAVING COUNT(*) > 5;
SELECT category,
AVG(unit_price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(unit_price) > 2500;