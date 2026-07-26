CREATE DATABASE company_db2;
USE company_db2;
CREATE TABLE employees (
    employee_id INT,
    full_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    gender VARCHAR(10),
    hire_date DATE,
    salary DECIMAL(10,2),
    department VARCHAR(30)
);
CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(50),
    location VARCHAR(50)
);
CREATE TABLE projects (
    project_id INT,
    project_name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12,2)
);
ALTER TABLE employees
ADD status VARCHAR(20);
ALTER TABLE employees
MODIFY department VARCHAR(50);
ALTER TABLE projects
CHANGE budget project_budget DECIMAL(12,2);
CREATE TABLE temp_employees (
    id INT,
    name VARCHAR(50)
);

TRUNCATE TABLE temp_employees;

DROP TABLE temp_employees;
INSERT INTO employees
VALUES
(1,'Amit Sharma','amit@gmail.com','9876543210','Male','2022-01-15',55000,'IT','Active'),
(2,'Priya Patil','priya@gmail.com','9876543211','Female','2021-06-20',48000,'HR','Active'),
(3,'Rahul Singh','rahul@gmail.com','9876543212','Male','2023-03-10',60000,'Finance','Active'),
(4,'Sneha Joshi','sneha@gmail.com','9876543213','Female','2020-09-05',30000,'Sales','Active'),
(5,'Rohan Mehta','rohan@gmail.com','9876543214','Male','2024-11-18',70000,'IT','Active'),
(6,'Neha Verma','neha@gmail.com','9876543215','Female','2025-02-12',28000,'HR','Active');
INSERT INTO departments
VALUES
(1,'IT','Mumbai'),
(2,'HR','Pune'),
(3,'Finance','Delhi'),
(4,'Sales','Remote');
DELETE FROM projects;
INSERT INTO projects
VALUES
(1,'Website Development','2024-01-01','2024-12-31',1500000),
(2,'Mobile App','2024-02-15','2025-01-30',2000000),
(3,'ERP System','2023-06-01','2024-10-15',1200000),
(4,'Cloud Migration','2024-04-10','2025-06-20',2500000),
(5,'AI Chatbot','2025-01-01','2025-12-31',1800000);
UPDATE employees
SET status='Active';
UPDATE employees
SET salary=salary+10000
WHERE employee_id=102;
DELETE FROM employees
WHERE employee_id=106;
DELETE FROM projects;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT full_name,email,salary
FROM employees;
SELECT department_name,location
FROM departments;
SELECT *
FROM employees
WHERE gender='Female';
SELECT *
FROM employees
WHERE salary>50000;
SELECT *
FROM employees
WHERE hire_date>'2021-01-01';
SELECT *
FROM employees
WHERE department='IT'
AND status='Active';
SELECT *
FROM projects
WHERE project_budget>1000000
AND end_date>'2024-12-31';
UPDATE employees
SET status='Inactive'
WHERE salary<30000;
DELETE FROM departments
WHERE location='Remote';