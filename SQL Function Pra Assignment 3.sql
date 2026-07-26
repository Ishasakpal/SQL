USE training_institute_db;
SELECT course_name, ROUND(course_fee, -3) AS rounded_fee
FROM courses;
SELECT course_name, CEIL(course_fee) AS ceiling_fee
FROM courses;
SELECT course_name, FLOOR(course_fee) AS floor_fee
FROM courses;
SELECT student_name, ABS(student_age - 25) AS age_difference
FROM students;
SELECT course_name, POWER(course_fee, 2) AS fee_square
FROM courses;
SELECT course_name, SQRT(course_fee) AS fee_sqrt
FROM courses;
SELECT student_id, MOD(student_age, 2) AS age_mod
FROM students;
SELECT student_name, SIGN(student_age - 22) AS age_sign
FROM students;
SELECT course_name, TRUNCATE(course_fee, 2) AS truncated_fee
FROM courses;
SELECT UPPER(trainer_name) AS trainer_name
FROM trainers;
SELECT LOWER(student_name) AS student_name
FROM students;
SELECT student_name, LENGTH(student_name) AS name_length
FROM students;
SELECT CONCAT(student_name, ' ', student_city) AS student_details
FROM students;
SELECT SUBSTRING(student_name, 1, 3) AS first_three_chars
FROM students;
SELECT LEFT(course_name, 2) AS first_two_chars
FROM courses;
SELECT RIGHT(course_name, 3) AS last_three_chars
FROM courses;
SELECT TRIM(student_name) AS student_name
FROM students;
SELECT REPLACE(student_city, 'Pune', 'PUNE_CITY') AS student_city
FROM students;
SELECT REVERSE(student_name) AS reversed_name
FROM students;
SELECT enrollment_id,
DATE_ADD(enrollment_date, INTERVAL 10 DAY) AS new_date
FROM enrollments;
SELECT enrollment_id,
DATE_SUB(enrollment_date, INTERVAL 5 DAY) AS new_date
FROM enrollments;
SELECT enrollment_id,
DATEDIFF(CURDATE(), enrollment_date) AS days_difference
FROM enrollments;
SELECT enrollment_id,
TIMESTAMPDIFF(MONTH, enrollment_date, CURDATE()) AS months_difference
FROM enrollments;
SELECT s.student_name,
YEAR(e.enrollment_date) AS enrollment_year
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT s.student_name,
MONTH(e.enrollment_date) AS enrollment_month
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT s.student_name,
DAY(e.enrollment_date) AS enrollment_day
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT s.student_name,
WEEK(e.enrollment_date) AS week_number
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT s.student_name,
QUARTER(e.enrollment_date) AS quarter_number
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT course_name, course_fee
FROM courses
WHERE ROUND(course_fee) > 40000;
SELECT *
FROM students
WHERE MOD(student_age, 2) = 0;
SELECT *
FROM students
WHERE LENGTH(student_name) > 5;
SELECT *
FROM enrollments
WHERE DATEDIFF(CURDATE(), enrollment_date) > 30;
SELECT *
FROM courses
WHERE SQRT(course_fee) > 200;
SELECT s.*
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
WHERE YEAR(e.enrollment_date) = YEAR(CURDATE());
SELECT *
FROM enrollments
WHERE MONTH(enrollment_date) = MONTH(CURDATE());


