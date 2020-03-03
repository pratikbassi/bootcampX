SELECT cohorts.name AS cohort, AVG((assistance_requests.completed_at - assistance_requests.started_at)) AS average_ass_time
FROM assistance_requests 
LEFT JOIN students on assistance_requests.student_id = students.id 
LEFT JOIN cohorts on students.cohort_id = cohorts.id
GROUP BY cohort
ORDER BY average_ass_time desc
LIMIT 1;