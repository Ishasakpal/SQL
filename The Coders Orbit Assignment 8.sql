USE company_db;
SHOW TABLES;
DESC customers;
SELECT *
FROM customers
WHERE created_at BETWEEN '2026-01-01' AND '2026-01-31';
SELECT customer_name
FROM customers
WHERE city IN ('Mumbai', 'Delhi');
SELECT *
FROM products
WHERE unit_price > 2500;
SELECT *
FROM products
WHERE unit_price BETWEEN 700 AND 1800;
SELECT *
FROM products
WHERE category <> 'Electronics';
SELECT *
FROM orders
WHERE order_date > '2026-01-10';
SELECT *
FROM customers
WHERE city IN ('Pune', 'Hyderabad', 'Chennai');
SELECT *
FROM products
WHERE brand NOT IN ('Sony', 'Nike');
SELECT *
FROM orders
WHERE channel = 'ONLINE';
SELECT * 
FROM orders 
WHERE channel <> 'OFFLINE';
SELECT * 
FROM products 
ORDER BY product_name ASC;
SELECT *
FROM customers
ORDER BY created_at DESC;
SELECT *
FROM orders
ORDER BY order_date DESC;
SELECT *
FROM products
ORDER BY unit_price DESC;
SELECT *
FROM customers
ORDER BY city ASC, customer_name ASC;
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category;
SELECT brand, AVG(unit_price) AS average_price
FROM products
GROUP BY brand;
SELECT category, MAX(unit_price) AS highest_price
FROM products
GROUP BY category;
SELECT category, MIN(unit_price) AS lowest_price
FROM products
GROUP BY category;
DESC orders;
SELECT c.city, COUNT(*) AS total_orders
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.city;
SELECT channel, COUNT(*) AS total_orders
FROM orders
GROUP BY channel;
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 2;
SELECT brand, AVG(unit_price) AS average_price
FROM products
GROUP BY brand
HAVING AVG(unit_price) > 2000;
SELECT category, MAX(unit_price) AS highest_price
FROM products
GROUP BY category
HAVING MAX(unit_price) > 4000;
SELECT channel, COUNT(*) AS total_orders
FROM orders
GROUP BY channel
HAVING COUNT(*) > 3;
SELECT *
FROM customers
WHERE email IS NULL;
SELECT *
FROM products
WHERE brand IS NULL;
SELECT *
FROM customers
WHERE email IS NOT NULL;
SELECT *
FROM products
WHERE brand IS NOT NULL;
SELECT *
FROM customers
ORDER BY created_at DESC
LIMIT 5;
SELECT *
FROM products
ORDER BY unit_price DESC
LIMIT 3;
SELECT *
FROM orders
ORDER BY order_date ASC
LIMIT 7;
SELECT *
FROM products
ORDER BY unit_price DESC
LIMIT 5 OFFSET 5;
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 4 OFFSET 2;