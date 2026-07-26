SHOW TABLES;
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM trainers;
SELECT * FROM enrollments;
DESC students;
DESC enrollments;
SELECT
    s.student_name,
    e.course_id,
    s.student_age,
    ROW_NUMBER() OVER(
        PARTITION BY e.course_id
        ORDER BY s.student_age
    ) AS rn
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT
    s.student_name,
    e.course_id,
    e.amount_paid,
    RANK() OVER(
        PARTITION BY e.course_id
        ORDER BY e.amount_paid DESC
    ) AS payment_rank
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    DENSE_RANK() OVER(
        PARTITION BY e.course_id
        ORDER BY e.amount_paid DESC
    ) AS payment_rank
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    course_name,
    course_fee,
    RANK() OVER(
        ORDER BY course_fee DESC
    ) AS fee_rank
FROM courses;
SELECT 
    t.trainer_name,
    SUM(e.amount_paid) AS total_revenue,
    RANK() OVER(
        ORDER BY SUM(e.amount_paid) DESC
    ) AS revenue_rank
FROM trainers t
JOIN courses c
ON t.trainer_id = c.trainer_id
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY t.trainer_name;
SELECT 
    s.student_name,
    e.enrollment_date,
    ROW_NUMBER() OVER(
        ORDER BY e.enrollment_date
    ) AS rn
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    c.course_name,
    COUNT(e.enrollment_id) AS total_enrollments,
    DENSE_RANK() OVER(
        ORDER BY COUNT(e.enrollment_id) DESC
    ) AS enrollment_rank
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_name;
SELECT 
    t.trainer_name,
    COUNT(e.student_id) AS total_students,
    RANK() OVER(
        ORDER BY COUNT(e.student_id) DESC
    ) AS student_rank
FROM trainers t
JOIN courses c
ON t.trainer_id = c.trainer_id
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY t.trainer_name;
SELECT 
    s.student_name,
    e.amount_paid,
    LAG(e.amount_paid) OVER(
        ORDER BY e.enrollment_date
    ) AS previous_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.amount_paid,
    LEAD(e.amount_paid) OVER(
        ORDER BY e.enrollment_date
    ) AS next_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.course_id,
    e.enrollment_date,
    LAG(e.enrollment_date) OVER(
        PARTITION BY e.course_id
        ORDER BY e.enrollment_date
    ) AS previous_enrollment_date
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    c.course_name,
    e.amount_paid,
    e.amount_paid - LAG(e.amount_paid) OVER(
        PARTITION BY e.course_id
        ORDER BY e.enrollment_date
    ) AS payment_difference
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    FIRST_VALUE(e.amount_paid) OVER(
        PARTITION BY e.course_id
        ORDER BY e.enrollment_date
    ) AS first_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    LAST_VALUE(e.amount_paid) OVER(
        PARTITION BY e.course_id
        ORDER BY e.enrollment_date
    ) AS last_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    t.trainer_name,
    c.course_fee,
    FIRST_VALUE(c.course_fee) OVER(
        PARTITION BY t.trainer_id
        ORDER BY c.course_fee DESC
    ) AS highest_course_fee
FROM trainers t
JOIN courses c
ON t.trainer_id = c.trainer_id;
SELECT 
    t.trainer_name,
    c.course_fee,
    LAST_VALUE(c.course_fee) OVER(
        PARTITION BY t.trainer_id
        ORDER BY c.course_fee DESC
    ) AS lowest_course_fee
FROM trainers t
JOIN courses c
ON t.trainer_id = c.trainer_id;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    NTH_VALUE(e.amount_paid, 2) OVER(
        PARTITION BY e.course_id
        ORDER BY e.amount_paid DESC
    ) AS nth_highest_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.amount_paid,
    NTILE(4) OVER(
        ORDER BY e.amount_paid DESC
    ) AS payment_group
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    course_name,
    course_fee,
    NTILE(3) OVER(
        ORDER BY course_fee DESC
    ) AS fee_category
FROM courses;
SELECT 
    s.student_name,
    e.amount_paid,
    PERCENT_RANK() OVER(
        ORDER BY e.amount_paid
    ) AS percentile_rank
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.amount_paid,
    CUME_DIST() OVER(
        ORDER BY e.amount_paid
    ) AS cumulative_distribution
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    t.trainer_name,
    SUM(e.amount_paid) AS total_revenue,
    PERCENT_RANK() OVER(
        ORDER BY SUM(e.amount_paid)
    ) AS percentile_rank
FROM trainers t
JOIN courses c
ON t.trainer_id = c.trainer_id
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY t.trainer_name;
SELECT 
    c.course_name,
    COUNT(e.enrollment_id) AS total_enrollments,
    CUME_DIST() OVER(
        ORDER BY COUNT(e.enrollment_id)
    ) AS cumulative_distribution
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_name;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    SUM(e.amount_paid) OVER(
        PARTITION BY e.course_id
        ORDER BY e.enrollment_date
    ) AS running_total
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    c.course_name,
    e.enrollment_date,
    e.amount_paid,
    SUM(e.amount_paid) OVER(
        PARTITION BY c.course_id
        ORDER BY e.enrollment_date
    ) AS cumulative_revenue
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id;
SELECT 
    t.trainer_name,
    COUNT(e.student_id) OVER(
        ORDER BY e.student_id
    ) AS cumulative_students
FROM trainers t
JOIN courses c
ON t.trainer_id = c.trainer_id
JOIN enrollments e
ON c.course_id = e.course_id;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    AVG(e.amount_paid) OVER(
        PARTITION BY e.course_id
        ORDER BY e.enrollment_date
    ) AS moving_average
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    c.course_name,
    e.amount_paid,
    AVG(e.amount_paid) OVER(
        ORDER BY e.enrollment_date
    ) AS cumulative_average
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    SUM(e.amount_paid) OVER(
        PARTITION BY e.course_id
    ) AS total_course_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    AVG(e.amount_paid) OVER(
        PARTITION BY e.course_id
    ) AS average_course_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    MAX(e.amount_paid) OVER(
        PARTITION BY e.course_id
    ) AS maximum_course_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    MIN(e.amount_paid) OVER(
        PARTITION BY e.course_id
    ) AS minimum_course_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    c.course_name,
    COUNT(e.enrollment_id) OVER(
        PARTITION BY c.course_id
    ) AS total_enrollments
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id;
SELECT 
    t.trainer_name,
    COUNT(c.course_id) OVER(
        PARTITION BY t.trainer_id
    ) AS total_courses
FROM trainers t
JOIN courses c
ON t.trainer_id = c.trainer_id;
SELECT 
    s.student_name,
    e.amount_paid,
    e.amount_paid - AVG(e.amount_paid) OVER(
        PARTITION BY e.course_id
    ) AS difference_from_average
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.amount_paid,
    (e.amount_paid / SUM(e.amount_paid) OVER(
        PARTITION BY e.course_id
    )) * 100 AS payment_percentage
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    c.course_name,
    SUM(e.amount_paid) AS course_revenue,
    (SUM(e.amount_paid) / SUM(SUM(e.amount_paid)) OVER()) * 100 AS revenue_percentage
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_name;
SELECT 
    t.trainer_name,
    e.amount_paid,
    AVG(e.amount_paid) OVER(
        PARTITION BY t.trainer_id
    ) AS average_revenue
FROM trainers t
JOIN courses c
ON t.trainer_id = c.trainer_id
JOIN enrollments e
ON c.course_id = e.course_id;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    MAX(e.amount_paid) OVER(
        PARTITION BY e.course_id
    ) AS highest_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.course_id,
    e.amount_paid,
    MIN(e.amount_paid) OVER(
        PARTITION BY e.course_id
    ) AS lowest_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    c.course_name,
    e.amount_paid,
    RANK() OVER(
        PARTITION BY c.course_id
        ORDER BY e.amount_paid DESC
    ) AS payment_rank
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id;
SELECT 
    course_name,
    student_name,
    student_age,
    DENSE_RANK() OVER(
        ORDER BY student_age
    ) AS age_rank
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id
JOIN students s
ON e.student_id = s.student_id;
SELECT 
    t.trainer_name,
    SUM(e.amount_paid) AS total_revenue,
    RANK() OVER(
        ORDER BY SUM(e.amount_paid) DESC
    ) AS revenue_rank
FROM trainers t
JOIN courses c
ON t.trainer_id = c.trainer_id
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY t.trainer_name;
SELECT 
    s.student_name,
    e.amount_paid,
    LEAD(e.amount_paid) OVER(
        ORDER BY e.enrollment_date
    ) AS next_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    s.student_name,
    e.amount_paid,
    LAG(e.amount_paid) OVER(
        ORDER BY e.enrollment_date
    ) AS previous_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    c.course_name,
    MAX(e.amount_paid) OVER(
        PARTITION BY c.course_id
    ) - MIN(e.amount_paid) OVER(
        PARTITION BY c.course_id
    ) AS payment_difference
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id;
SELECT 
    s.student_name,
    e.amount_paid,
    LAG(e.amount_paid) OVER(
        PARTITION BY e.course_id
        ORDER BY e.enrollment_date
    ) AS previous_payment
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;
SELECT 
    t.trainer_name,
    e.amount_paid,
    SUM(e.amount_paid) OVER(
        ORDER BY e.enrollment_date
    ) AS running_revenue
FROM trainers t
JOIN courses c
ON t.trainer_id = c.trainer_id
JOIN enrollments e
ON c.course_id = e.course_id;
SELECT 
    c.course_name,
    e.amount_paid,
    AVG(e.amount_paid) OVER(
        ORDER BY e.enrollment_date
        ROWS 2 PRECEDING
    ) AS rolling_average
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id;
SELECT 
    s.student_name,
    e.amount_paid,
    CASE
        WHEN e.amount_paid > AVG(e.amount_paid) OVER(
            PARTITION BY e.course_id
        )
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS payment_status
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id;