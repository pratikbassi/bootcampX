SELECT cohorts.name, count(assignment_submissions.id) 
FROM (assignment_submissions LEFT JOIN students ON students.id = assignment_submissions.student_id) 
    LEFT JOIN cohorts on students.cohort_id = cohorts.id
GROUP BY cohorts.name 
HAVING cohorts.name is NOT NULL
ORDER BY count(assignment_submissions) DESC;
