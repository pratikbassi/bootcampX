SELECT AVG(total_duration)
FROM (SELECT cohorts.name, SUM((assistance_requests.completed_at -  assistance_requests.started_at)) as total_duration
FROM assistance_requests
  LEFT JOIN students ON assistance_requests.student_id = students.id 
  LEFT JOIN cohorts ON students.cohort_id = cohorts.id 
WHERE cohorts.name IS NOT NULL
GROUP BY cohorts.name
ORDER BY total_duration) as average;