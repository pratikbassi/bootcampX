SELECT COUNT(assistance_requests), name 
FROM teachers LEFT JOIN assistance_requests 
ON teachers.id = assistance_requests.teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY name;