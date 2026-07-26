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
WHERE customer_id IN (101, 104, 108, 110);
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
INSERT INTO customers
VALUES
(111,'Riya','Pune',NULL,'9876500001','2026-02-01'),
(112,'Kunal','Mumbai',NULL,'9876500002','2026-02-02'),
(113,'Megha','Delhi','megha@gmail.com','9876500003','2026-02-03'),
(114,'Arjun','Nagpur','arjun@gmail.com','9876500004','2026-02-04'),
(115,'Sonal','Nashik','sonal@gmail.com','9876500005','2026-02-05');
SELECT * 
FROM customers 
WHERE email IS NULL;
SELECT * 
FROM customers 
WHERE email IS NOT NULL;
INSERT INTO products
VALUES
(211,'Scale','Stationery',NULL,80),
(212,'Bag','Fitness',NULL,900),
(213,'Monitor','Electronics','LG',12000),
(214,'Charger','Electronics','Samsung',1500),
(215,'Book','Stationery','Navneet',200),
(216,'Watch','Fitness','Titan',3500);
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