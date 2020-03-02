SELECT 
  students.name AS name, 
  students.start_date AS student_start, 
  cohorts.name AS cohort_name, 
  cohorts.start_date AS cohort_start
FROM students INNER JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE NOT cohorts.start_date = students.start_date;