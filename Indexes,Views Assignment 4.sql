SHOW DATABASES;
USE college_db;
SHOW TABLES;
CREATE INDEX idx_trainer_city
ON trainers(trainer_city);
CREATE INDEX idx_student_city_age
ON students(student_city, student_age);
CREATE INDEX idx_payment_status
ON enrollments(payment_status);
CREATE INDEX idx_course_fee
ON courses(course_fee);
SELECT *
FROM students
WHERE student_city='Pune';
SELECT *
FROM courses
WHERE course_fee>50000;
CREATE UNIQUE INDEX idx_trainer_email
ON trainers(trainer_email);
CREATE INDEX idx_course_enrollment_date
ON enrollments(course_id, enrollment_date);
DROP INDEX idx_payment_status
ON enrollments;
SHOW INDEX
FROM students;
CREATE INDEX idx_amount_paid
ON enrollments(amount_paid);
SELECT *
FROM enrollments
WHERE amount_paid > 30000;
CREATE INDEX idx_enrollment_date
ON enrollments(enrollment_date);
SELECT *
FROM enrollments
WHERE MONTH(enrollment_date)=MONTH(CURDATE())
AND YEAR(enrollment_date)=YEAR(CURDATE());
CREATE INDEX idx_trainer_course_fee
ON courses(trainer_id, course_fee);
DROP INDEX idx_student_city_age
ON students;
CREATE VIEW student_course_trainer AS
SELECT student_name, course_name, trainer_name
FROM students
JOIN enrollments USING(student_id)
JOIN courses USING(course_id)
JOIN trainers USING(trainer_id);
CREATE VIEW paid_enrollments AS
SELECT *
FROM enrollments
WHERE payment_status='Paid';
CREATE VIEW course_enrollments AS
SELECT course_name, COUNT(student_id) AS total_enrollments
FROM courses
JOIN enrollments USING(course_id)
GROUP BY course_name;
CREATE VIEW trainer_revenue AS
SELECT trainer_name, SUM(amount_paid) AS total_revenue
FROM trainers
JOIN courses USING(trainer_id)
JOIN enrollments USING(course_id)
GROUP BY trainer_name;
CREATE VIEW pune_students AS
SELECT *
FROM students
WHERE student_city='Pune';
CREATE VIEW high_fee_courses AS
SELECT *
FROM courses
WHERE course_fee > 40000;
CREATE VIEW avg_amount_course AS
SELECT course_id, AVG(amount_paid) AS avg_amount
FROM enrollments
GROUP BY course_id;
CREATE VIEW student_payment AS
SELECT student_name, payment_status
FROM students
JOIN enrollments USING(student_id);
CREATE VIEW trainer_multiple_courses AS
SELECT trainer_id, COUNT(course_id) AS total_courses
FROM courses
GROUP BY trainer_id
HAVING COUNT(course_id) > 1;
CREATE VIEW current_year_enrollments AS
SELECT *
FROM enrollments
WHERE YEAR(enrollment_date) = YEAR(CURDATE());
SELECT * FROM paid_enrollments;
UPDATE pune_students
SET student_city = 'Mumbai'
WHERE student_id = 1;
DROP VIEW trainer_multiple_courses;
CREATE VIEW student_course_details AS
SELECT student_name, course_name, enrollment_date, amount_paid
FROM students
JOIN enrollments USING(student_id)
JOIN courses USING(course_id);
CREATE VIEW courses_no_enrollments AS
SELECT course_name
FROM courses
WHERE course_id NOT IN
(SELECT course_id FROM enrollments);
WITH pune_students AS
(
SELECT *
FROM students
WHERE student_city='Pune'
)
SELECT * FROM pune_students;
WITH avg_fee AS
(
SELECT AVG(course_fee) AS avgfee
FROM courses
)
SELECT *
FROM courses
WHERE course_fee > (SELECT avgfee FROM avg_fee);
WITH paid AS
(
SELECT *
FROM enrollments
WHERE payment_status='Paid'
)
SELECT * FROM paid;
WITH revenue AS
(
SELECT SUM(amount_paid) AS total_revenue
FROM enrollments
)
SELECT * FROM revenue;
WITH trainer_course AS
(
SELECT trainer_id,COUNT(course_id) AS total_courses
FROM courses
GROUP BY trainer_id
)
SELECT trainer_name,total_courses
FROM trainers
JOIN trainer_course USING(trainer_id);
WITH course_students AS
(
SELECT course_id,COUNT(student_id) AS total_students
FROM enrollments
GROUP BY course_id
)
SELECT course_name,total_students
FROM courses
JOIN course_students USING(course_id);
WITH avg_age AS
(
SELECT AVG(student_age) AS age
FROM students
)
SELECT *
FROM students
WHERE student_age > (SELECT age FROM avg_age);
WITH max_fee AS
(
SELECT MAX(course_fee) AS fee
FROM courses
)
SELECT *
FROM courses
WHERE course_fee=(SELECT fee FROM max_fee);
WITH revenue AS
(
SELECT trainer_id,SUM(amount_paid) AS total_revenue
FROM courses
JOIN enrollments USING(course_id)
GROUP BY trainer_id
)
SELECT trainer_name,total_revenue
FROM trainers
JOIN revenue USING(trainer_id);
WITH avg_paid AS
(
SELECT AVG(amount_paid) AS avgpay
FROM enrollments
)
SELECT student_name,amount_paid
FROM students
JOIN enrollments USING(student_id)
WHERE amount_paid > (SELECT avgpay FROM avg_paid);
WITH current_month AS
(
SELECT *
FROM enrollments
WHERE MONTH(enrollment_date)=MONTH(CURDATE())
AND YEAR(enrollment_date)=YEAR(CURDATE())
)
SELECT * FROM current_month;
WITH top_courses AS
(
SELECT *
FROM courses
ORDER BY course_fee DESC
LIMIT 3
)
SELECT * FROM top_courses;
WITH city_students AS
(
SELECT student_city,COUNT(*) AS total_students
FROM students
GROUP BY student_city
HAVING COUNT(*)>2
)
SELECT * FROM city_students;
WITH mumbai_trainers AS
(
SELECT *
FROM trainers
WHERE trainer_city='Mumbai'
)
SELECT * FROM mumbai_trainers;
WITH course_amount AS
(
SELECT course_id,SUM(amount_paid) AS total_amount
FROM enrollments
GROUP BY course_id
HAVING SUM(amount_paid)>50000
)
SELECT course_name,total_amount
FROM courses
JOIN course_amount USING(course_id);
WITH student_course AS
(
SELECT student_name,course_name
FROM students
JOIN enrollments USING(student_id)
JOIN courses USING(course_id)
)
SELECT * FROM student_course;
WITH payment_total AS
(
SELECT payment_status,SUM(amount_paid) AS total_amount
FROM enrollments
GROUP BY payment_status
)
SELECT * FROM payment_total;
WITH pending_courses AS
(
SELECT DISTINCT course_id
FROM enrollments
WHERE payment_status='Pending'
)
SELECT course_name
FROM courses
JOIN pending_courses USING(course_id);
WITH city_avg_age AS
(
SELECT student_city,AVG(student_age) AS average_age
FROM students
GROUP BY student_city
)
SELECT * FROM city_avg_age;
WITH trainer_fee AS
(
SELECT trainer_id,AVG(course_fee) AS average_fee
FROM courses
GROUP BY trainer_id
)
SELECT trainer_name,average_fee
FROM trainers
JOIN trainer_fee USING(trainer_id);