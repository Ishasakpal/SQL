USE company_db;
SHOW TABLES;
CREATE TABLE departments(
department_id INT,
department_name VARCHAR(50),
location VARCHAR(50)
);
CREATE TABLE projects(
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
CREATE TABLE temp_employees(
employees_id INT,
full_name VARCHAR(50)
);
TRUNCATE TABLE temp_employees;
DROP TABLE temp_employees;