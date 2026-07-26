USE training_institute_db;
SELECT * FROM courses;
SELECT 
course_name,
ROUND(course_fee, -3) AS rounded_fee
FROM courses;
SELECT
course_name,
CEILING(course_fee) AS ceiling_fee
FROM courses;
SELECT
course_name,
FLOOR(course_fee) AS floor_fee
FROM courses;
SELECT
course_name,
POWER(course_fee, 2) AS fee_square
FROM courses;
SELECT
course_name,
SQRT(course_fee) AS fee_sqrt
FROM courses;
SELECT
student_id,
MOD(student_age, 2) AS remainder
FROM students;
SELECT
student_name,
SIGN(student_age - 22) AS age_sign
FROM students;
SELECT
course_name,
TRUNCATE(course_fee, 2) AS truncated_fee
FROM courses;
SELECT
trainer_name,
UPPER(trainer_name) AS upper_name
FROM trainers;
SELECT
student_name,
LOWER(student_name) AS lower_name
FROM students;
SELECT
student_name,
LENGTH(student_name) AS name_length
FROM students;
SELECT
CONCAT(student_name, ' ', student_city) AS student_details
FROM students;
SELECT
student_name,
SUBSTRING(student_name, 1, 3) AS first_three
FROM students;
SELECT
course_name,
LEFT(course_name, 2) AS first_two
FROM courses;
SELECT
course_name,
RIGHT(course_name, 3) AS last_three
FROM courses;
SELECT
TRIM(student_name) AS student_name
FROM students;
SELECT
REPLACE(student_city, 'Pune', 'PUNE_CITY') AS city_name
FROM students;
SELECT
REVERSE(student_name) AS reverse_name
FROM students;
SELECT
enrollment_id,
DATE_ADD(enrollment_date, INTERVAL 10 DAY) AS new_date
FROM enrollments;
SELECT
enrollment_id,
DATE_SUB(enrollment_date, INTERVAL 5 DAY) AS new_date
FROM enrollments;
SELECT
enrollment_id,
DATEDIFF(CURRENT_DATE, enrollment_date) AS days_difference
FROM enrollments;
SELECT
enrollment_id,
TIMESTAMPDIFF(MONTH, enrollment_date, CURRENT_DATE) AS months_difference
FROM enrollments;

DESC enrollments;
SELECT
s.student_name,
YEAR(e.enrollment_date) AS enrollment_year
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT
s.student_name,
MONTH(e.enrollment_date) AS enrollment_month
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT
s.student_name,
DAY(e.enrollment_date) AS enrollment_day
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT
s.student_name,
WEEK(e.enrollment_date) AS enrollment_week
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT
s.student_name,
QUARTER(e.enrollment_date) AS enrollment_quarter
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT
course_name,
course_fee
FROM courses
WHERE ROUND(course_fee) > 40000;
SELECT
student_name,
student_age
FROM students
WHERE MOD(student_age,2) = 0;
SELECT
s.student_name
FROM students s
WHERE LENGTH(s.student_name) > 5;
SELECT
e.enrollment_id,
e.enrollment_date
FROM enrollments e
WHERE DATEDIFF(CURRENT_DATE, e.enrollment_date) > 30;
SELECT
course_name,
course_fee
FROM courses
WHERE SQRT(course_fee) > 200;
SELECT
s.student_name,
e.enrollment_date
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
WHERE YEAR(e.enrollment_date) = YEAR(CURRENT_DATE);
SELECT
e.enrollment_id,
e.enrollment_date
FROM enrollments e
WHERE MONTH(e.enrollment_date) = MONTH(CURRENT_DATE);