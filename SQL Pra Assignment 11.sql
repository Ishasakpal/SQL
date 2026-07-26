USE training_institute_db;
SELECT *
FROM students
WHERE (course_id, student_city) IN
(
    SELECT course_id, student_city
    FROM students
    WHERE student_city = 'Pune'
);
SELECT *
FROM students
WHERE (course_id, student_age) IN
(
    SELECT course_id, student_age
    FROM students
    WHERE student_age > 22
);
SELECT *
FROM courses
WHERE (course_id, trainer_id) IN
(
    SELECT course_id, trainer_id
    FROM courses
    WHERE trainer_id IN
    (
        SELECT trainer_id
        FROM trainers
        WHERE experience_years > 3
    )
);
SELECT *
FROM enrollments
WHERE (student_id, course_id) IN
(
    SELECT student_id, course_id
    FROM students
);
SELECT *
FROM students s
WHERE student_age >
(
    SELECT AVG(student_age)
    FROM students
    WHERE course_id = s.course_id
);
SELECT *
FROM courses
WHERE course_id IN
(
    SELECT course_id
    FROM payments
    GROUP BY course_id
    HAVING AVG(amount_paid) >
    (
        SELECT AVG(amount_paid)
        FROM payments
    )
);
SELECT *
FROM trainers
WHERE trainer_id IN
(
    SELECT trainer_id
    FROM courses
    GROUP BY trainer_id
    HAVING COUNT(course_id) >
    (
        SELECT AVG(course_count)
        FROM
        (
            SELECT COUNT(course_id) AS course_count
            FROM courses
            GROUP BY trainer_id
        ) AS temp
    )
);
SELECT *
FROM payments p
WHERE amount_paid >
(
    SELECT AVG(amount_paid)
    FROM payments
    WHERE course_id = p.course_id
);
SELECT *
FROM courses
WHERE course_id IN
(
    SELECT course_id
    FROM payments
    WHERE amount_paid > 40000
);
SELECT *
FROM students
WHERE course_id IN
(
    SELECT course_id
    FROM courses
    WHERE trainer_id IN
    (
        SELECT trainer_id
        FROM trainers
        WHERE trainer_city = 'Mumbai'
    )
);
SELECT *
FROM students
WHERE course_id IN
(
    SELECT course_id
    FROM courses
    WHERE course_fee >
    (
        SELECT AVG(course_fee)
        FROM courses
    )
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
        FROM payments
    )
);
SELECT *
FROM courses
WHERE course_id IN
(
    SELECT course_id
    FROM students
    WHERE student_age > 25
); 
SELECT 
    student_name,
    student_age,
    CASE
        WHEN student_age < 22 THEN 'Young'
        WHEN student_age BETWEEN 22 AND 30 THEN 'Adult'
        ELSE 'Senior'
    END AS age_category
FROM students;
SELECT 
    course_name,
    course_fee,
    CASE
        WHEN course_fee < 30000 THEN 'Low'
        WHEN course_fee BETWEEN 30000 AND 60000 THEN 'Medium'
        ELSE 'High'
    END AS fee_category
FROM courses;
SELECT 
    s.student_name,
    p.payment_status,
    CASE
        WHEN p.payment_status = 'Paid' THEN 'Completed'
        WHEN p.payment_status = 'Partial' THEN 'In Progress'
        WHEN p.payment_status = 'Pending' THEN 'Not Paid'
    END AS payment_label
FROM students s
JOIN payments p
ON s.student_id = p.student_id;
SELECT 
    trainer_name,
    experience_years,
    CASE
        WHEN experience_years < 3 THEN 'Beginner'
        WHEN experience_years BETWEEN 3 AND 6 THEN 'Intermediate'
        ELSE 'Expert'
    END AS experience_category
FROM trainers;