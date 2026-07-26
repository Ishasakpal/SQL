USE training_institute_db;
CREATE TABLE trainers (
    trainer_id INT PRIMARY KEY,
    trainer_name VARCHAR(100) NOT NULL,
    trainer_email VARCHAR(100) UNIQUE NOT NULL,
    trainer_city VARCHAR(50) NOT NULL,
    experience_years INT NOT NULL CHECK (experience_years >= 0)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_duration_months INT NOT NULL,
    course_fee DECIMAL(10,2) NOT NULL CHECK (course_fee > 0),
    trainer_id INT,
    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id)
);
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    student_email VARCHAR(100) UNIQUE NOT NULL,
    student_phone VARCHAR(15),
    student_city VARCHAR(50),
    student_age INT CHECK (student_age >= 18),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    payment_status VARCHAR(20)
        CHECK (payment_status IN ('Paid','Pending','Partial')),
    amount_paid DECIMAL(10,2)
        CHECK (amount_paid >= 0),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO trainers
VALUES
(101,'Amit Shinde','amit@gmail.com','Mumbai',8),
(102,'Priya Patil','priya@gmail.com','Pune',5),
(103,'Rahul Ghade','rahul@gmail.com','Delhi',3),
(104,'Sneha Patil','sneha@gmail.com','Bangalore',6),
(105,'Karan Shelar','karan@gmail.com','Hyderabad',1);
INSERT INTO courses
VALUES
(106,'Data Science',8,60000,101),
(107,'Python Programming',4,30000,102),
(108,'Java Full Stack',6,45000,103),
(109,'Web Development',5,35000,104),
(110,'Machine Learning',9,70000,101),
(111,'SQL',3,25000,102);
INSERT INTO students
VALUES
(112,'Aarav','aarav@gmail.com','9876543210','Pune',22,106),
(113,'Diya','diya@gmail.com','9876543211','Mumbai',21,107),
(114,'Rohan','rohan@gmail.com','9876543212','Delhi',24,108),
(115,'Neha','neha@gmail.com','9876543213','Bangalore',20,109),
(116,'Vikram','vikram@gmail.com','9876543214','Pune',23,110),
(117,'Anjali','anjali@gmail.com',NULL,'Mumbai',19,111),
(118,'Kunal','kunal@gmail.com','9876543216','Hyderabad',25,106),
(119,'Pooja','pooja@gmail.com','9876543217','Pune',22,107),
(120,'Sahil','sahil@gmail.com',NULL,'Delhi',26,108),
(121,'Meera','meera@gmail.com','9876543219','Bangalore',21,109);
INSERT INTO enrollments
(enrollment_id,student_id,course_id,enrollment_date,payment_status,amount_paid)
VALUES
(122,112,106,'2026-01-10','Paid',60000),
(123,113,107,'2026-01-11','Pending',10000),
(124,114,108,'2026-01-12','Partial',25000),
(125,115,109,'2026-01-13','Paid',35000),
(126,116,110,'2026-01-14','Pending',20000),
(127,117,111,'2026-01-15','Paid',25000),
(128,118,106,'2026-01-16','Partial',30000),
(129,119,107,'2026-01-17','Paid',30000),
(130,120,108,'2026-01-18','Pending',15000),
(131,121,109,'2026-01-19','Paid',35000);
UPDATE trainers
SET trainer_city='Chennai'
WHERE trainer_id=103;
UPDATE courses
SET course_fee=50000
WHERE course_id=108;
SET SQL_SAFE_UPDATES = 0;
UPDATE courses
SET course_fee = course_fee * 1.10;
SET SQL_SAFE_UPDATES = 1;
UPDATE enrollments
SET payment_status='Paid'
WHERE enrollment_id=123;
UPDATE students
SET course_id=111
WHERE student_id=112;
DELETE FROM courses
WHERE course_id = 111;
DELETE FROM enrollments
WHERE course_id = 111;
DELETE FROM students
WHERE course_id = 111;
SELECT *
FROM trainers
WHERE experience_years < 2;
DELETE FROM trainers
WHERE trainer_id = 105;
SELECT *
FROM students
WHERE student_city='Pune';
SELECT *
FROM trainers
WHERE trainer_city='Mumbai';
SELECT *
FROM courses
WHERE course_fee > 40000;
SELECT *
FROM students
WHERE student_age > 22;
SELECT *
FROM enrollments
WHERE payment_status='Paid';
SELECT *
FROM students
ORDER BY student_name ASC;
SELECT *
FROM trainers
ORDER BY experience_years DESC;
SELECT *
FROM courses
ORDER BY course_fee DESC;
SELECT *
FROM enrollments
ORDER BY amount_paid ASC;
SELECT DISTINCT student_city
FROM students;
SELECT DISTINCT trainer_city
FROM trainers;
SELECT DISTINCT payment_status
FROM enrollments;
SELECT *
FROM students
WHERE student_age BETWEEN 20 AND 25;
SELECT *
FROM courses
WHERE course_fee BETWEEN 30000 AND 60000;
SELECT *
FROM trainers
WHERE experience_years BETWEEN 3 AND 8;
SELECT *
FROM students
WHERE student_city IN ('Pune','Mumbai','Bangalore');
SELECT *
FROM enrollments
WHERE payment_status IN ('Paid','Partial');
SELECT *
FROM trainers
WHERE trainer_city IN ('Delhi','Hyderabad');
SELECT *
FROM students
WHERE student_phone IS NULL;
SELECT *
FROM students
WHERE student_email IS NOT NULL;
SELECT *
FROM students
LIMIT 5;
SELECT *
FROM courses
ORDER BY course_fee DESC
LIMIT 3;
SELECT *
FROM trainers
LIMIT 2;
SELECT COUNT(*) AS total_students
FROM students;
SELECT AVG(student_age) AS average_age
FROM students;
SELECT MAX(course_fee) AS maximum_fee
FROM courses;
SELECT MIN(course_fee) AS minimum_fee
FROM courses;
SELECT SUM(amount_paid) AS total_amount_paid
FROM enrollments;
SELECT student_city, COUNT(*) AS total_students
FROM students
GROUP BY student_city;
SELECT trainer_id, COUNT(*) AS total_courses
FROM courses
GROUP BY trainer_id;
SELECT payment_status, SUM(amount_paid) AS total_amount
FROM enrollments
GROUP BY payment_status;
SELECT course_id, AVG(student_age) AS average_age
FROM students
GROUP BY course_id;
SELECT student_city, COUNT(*) AS total_students
FROM students
GROUP BY student_city
HAVING COUNT(*) > 2;
SELECT trainer_id, COUNT(*) AS total_courses
FROM courses
GROUP BY trainer_id
HAVING COUNT(*) > 1;
SELECT payment_status, SUM(amount_paid) AS total_amount
FROM enrollments
GROUP BY payment_status
HAVING SUM(amount_paid) > 50000;
SELECT 
students.student_name,
courses.course_name
FROM students
JOIN courses
ON students.course_id = courses.course_id;
SELECT
courses.course_name,
trainers.trainer_name
FROM courses
JOIN trainers
ON courses.trainer_id = trainers.trainer_id;
SELECT
students.student_name,
courses.course_name,
enrollments.enrollment_date
FROM enrollments
JOIN students
ON enrollments.student_id = students.student_id
JOIN courses
ON enrollments.course_id = courses.course_id;
SELECT
students.student_name,
enrollments.payment_status
FROM students
JOIN enrollments
ON students.student_id = enrollments.student_id;
SELECT
trainers.trainer_name,
courses.course_name
FROM trainers
JOIN courses
ON trainers.trainer_id = courses.trainer_id;
SELECT
courses.course_name,
students.student_name
FROM courses
JOIN students
ON courses.course_id = students.course_id;
SELECT
students.student_name,
enrollments.enrollment_id,
enrollments.enrollment_date,
enrollments.payment_status,
enrollments.amount_paid
FROM students
JOIN enrollments
ON students.student_id = enrollments.student_id;
SELECT
courses.course_name,
trainers.trainer_name
FROM courses
JOIN trainers
ON courses.trainer_id = trainers.trainer_id;
SELECT
enrollments.enrollment_id,
students.student_name,
students.student_email,
enrollments.payment_status,
enrollments.amount_paid
FROM enrollments
JOIN students
ON enrollments.student_id = students.student_id;
SELECT
students.student_name
FROM students
JOIN courses
ON students.course_id = courses.course_id
WHERE courses.course_name='Data Science';
SELECT
trainers.trainer_name,
courses.course_name,
courses.course_fee
FROM trainers
JOIN courses
ON trainers.trainer_id = courses.trainer_id
WHERE courses.course_fee > 50000;
SELECT
students.student_name,
enrollments.payment_status
FROM students
JOIN enrollments
ON students.student_id = enrollments.student_id
WHERE payment_status='Paid';
SELECT
course_id,
COUNT(*) AS total_students
FROM students
GROUP BY course_id;
SELECT *
FROM courses
WHERE course_fee = (SELECT MAX(course_fee) FROM courses);
SELECT
students.student_name,
courses.course_name
FROM students
JOIN courses
ON students.course_id = courses.course_id
WHERE students.student_city='Pune';
SELECT
trainers.trainer_name,
trainers.trainer_city,
courses.course_name,
courses.course_duration_months
FROM trainers
JOIN courses
ON trainers.trainer_id = courses.trainer_id
WHERE courses.course_duration_months > 6;
SELECT
course_id,
SUM(amount_paid) AS total_amount_collected
FROM enrollments
GROUP BY course_id;
SELECT *
FROM students
WHERE student_name LIKE '%a%'
AND student_age > 20;
SELECT
courses.*
FROM courses
LEFT JOIN students
ON courses.course_id = students.course_id
WHERE students.student_id IS NULL;
SELECT
trainers.*
FROM trainers
LEFT JOIN courses
ON trainers.trainer_id = courses.trainer_id
WHERE courses.course_id IS NULL;
SELECT
students.student_name,
enrollments.amount_paid
FROM students
JOIN enrollments
ON students.student_id = enrollments.student_id
WHERE amount_paid > 30000;
SELECT
course_id,
AVG(amount_paid) AS average_amount_paid
FROM enrollments
GROUP BY course_id;
SELECT
courses.course_name,
COUNT(enrollments.enrollment_id) AS total_enrollments
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.course_name;
SELECT
students.student_name,
courses.course_name,
enrollments.payment_status
FROM enrollments
JOIN students
ON enrollments.student_id = students.student_id
JOIN courses
ON enrollments.course_id = courses.course_id
WHERE enrollments.payment_status='Partial';
INSERT INTO students
VALUES
(132,'Test Student','aarav@gmail.com','9999999999','Pune',22,106);
INSERT INTO courses
VALUES
(133,'Testing Course',3,-5000,101);
INSERT INTO students
VALUES
(134,'Test Age','testage@gmail.com','9999999998','Mumbai',15,106);
INSERT INTO enrollments
VALUES
(135,112,106,CURRENT_DATE,'Failed',5000);
INSERT INTO courses
VALUES
(136,'Cyber Security',6,50000,999);