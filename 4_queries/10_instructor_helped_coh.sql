SELECT DISTINCT teachers.name, cohorts.name
FROM teachers
LEFT JOIN assistance_requests on assistance_requests.teacher_id = teachers.id 
LEFT JOIN students on assistance_requests.student_id = students.id 
LEFT JOIN cohorts on cohorts.id = students.cohort_id
WHERE cohorts.name = 'JUL02'
ORDER BY teachers.name;