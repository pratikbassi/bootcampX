SELECT cohorts.name, count(cohort_id) as student_count
FROM students LEFT JOIN cohorts 
ON students.cohort_id = cohorts.id
GROUP BY cohorts.name 
HAVING count(cohort_id) >= 18
ORDER BY student_count;