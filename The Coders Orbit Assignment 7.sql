CREATE DATABASE shop_db;
USE shop_db;
CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50),
email VARCHAR(100),
created_at DATE
);
CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
order_status VARCHAR(30),
channel VARCHAR(20)
);
INSERT INTO orders VALUES
(1,101,'2026-01-03','PLACED','ONLINE'),
(2,102,'2026-01-10','DELIVERED','OFFLINE'),
(3,103,'2026-01-15','CANCELLED','ONLINE'),
(4,104,'2026-01-22','PLACED','ONLINE'),
(5,108,'2026-02-01','DELIVERED','OFFLINE'),
(6,110,'2026-02-05','PLACED','ONLINE');
CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50),
brand VARCHAR(50),
unit_price INT
);
INSERT INTO products VALUES
(1,'Mobile','Electronics','Samsung',25000),
(2,'Shoes','Fitness','Nike',3000),
(3,'Notebook','Stationery','Classmate',100),
(4,'Headphone','Electronics','Sony',1500),
(5,'Watch','Fitness','Boat',2000),
(6,'Pen','Stationery',NULL,50);
SELECT *
FROM customers
WHERE city NOT BETWEEN 'Delhi' AND 'Pune';
SELECT *
FROM orders
WHERE order_date NOT BETWEEN '2026-01-05' AND '2026-01-20';
SELECT *
FROM products
WHERE unit_price NOT BETWEEN 500 AND 2000;
SELECT *
FROM customers
WHERE customer_id IN (101,104,108,110);
SELECT *
FROM products
WHERE category IN ('Electronics','Fitness','Stationery');
SELECT *
FROM orders
WHERE order_status IN ('PLACED','DELIVERED');
SELECT *
FROM customers
WHERE city NOT IN ('Pune','Mumbai');
SELECT *
FROM products
WHERE brand NOT IN ('Sony','Nike','Boat');
SELECT *
FROM orders
WHERE channel NOT IN ('ONLINE');
INSERT INTO customers(customer_id, customer_name, city, email, created_at)
VALUES
(111,'Amit','Pune','amit@gmail.com','2026-02-01'),
(112,'Riya','Mumbai',NULL,'2026-02-02'),
(113,'Neha','Delhi','neha@gmail.com','2026-02-03'),
(114,'Rahul','Nashik',NULL,'2026-02-04'),
(115,'Kiran','Surat','kiran@gmail.com','2026-02-05');
SELECT *
FROM customers
WHERE email IS NULL;
SELECT *
FROM customers
WHERE email IS NOT NULL;
INSERT INTO products(product_id, product_name, category, brand, unit_price)
VALUES
(101,'Laptop','Electronics','HP',55000),
(102,'Treadmill','Fitness',NULL,30000),
(103,'Diary','Stationery','Classmate',200),
(104,'Camera','Electronics',NULL,45000),
(105,'Dumbbell','Fitness','Adidas',5000),
(106,'Marker','Stationery','Camlin',100);
SELECT *
FROM products
WHERE brand IS NULL;
SELECT *
FROM products
WHERE brand IS NOT NULL;
SELECT *
FROM customers
ORDER BY created_at ASC
LIMIT 5;
SELECT *
FROM customers
ORDER BY created_at ASC
LIMIT 5 OFFSET 5;
SELECT *
FROM products
ORDER BY unit_price DESC
LIMIT 3;
SELECT *
FROM products
ORDER BY unit_price DESC
LIMIT 5 OFFSET 5;
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 7 OFFSET 3;