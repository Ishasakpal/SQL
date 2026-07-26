SHOW DATABASES;
USE training_institute_db;
SHOW TABLES;
SELECT *
FROM students
WHERE student_age >
(
    SELECT AVG(student_age)
    FROM students
);
SELECT *
FROM courses
WHERE course_fee >
(
    SELECT AVG(course_fee)
    FROM courses
);
SELECT *
FROM trainers
WHERE experience_years >
(
    SELECT MIN(experience_years)
    FROM trainers
);
SELECT *
FROM students
WHERE course_id = (
SELECT course_id
FROM courses
WHERE course_fee = (SELECT MAX(course_fee) FROM courses)
);
SELECT course_name
FROM courses
WHERE course_fee =
(
    SELECT MIN(course_fee)
    FROM courses
);
SELECT *
FROM students
WHERE student_age =
(
    SELECT MAX(student_age)
    FROM students
);
SELECT *
FROM trainers
WHERE experience_years <
(
    SELECT AVG(experience_years)
    FROM trainers
);
SELECT *
FROM students
WHERE course_id IN
(
    SELECT course_id
    FROM courses
    WHERE trainer_id = 1
);
SELECT *
FROM students
WHERE course_id IN
(
    SELECT course_id
    FROM courses
    WHERE course_fee > 50000
);
SELECT *
FROM trainers
WHERE trainer_id IN
(
    SELECT trainer_id
    FROM courses
    WHERE course_id IN
    (
        SELECT course_id
        FROM enrollments
    )
);
SELECT *
FROM courses
WHERE course_id IN
(
    SELECT course_id
    FROM students
    WHERE student_city = 'Pune'
);
SELECT *
FROM students
WHERE course_id NOT IN
(
    SELECT course_id
    FROM courses
    WHERE course_fee < 30000
);
SELECT *
FROM trainers
WHERE trainer_id IN
(
    SELECT trainer_id
    FROM courses
    GROUP BY trainer_id
    HAVING COUNT(course_id) > 1
);
DESC enrollments;
SELECT student_id, student_name 
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM enrollments
    WHERE payment_status IN ('Paid','Partial')
);