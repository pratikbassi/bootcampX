SELECT students.name, AVG(assignment_submissions.duration) as average
FROM students LEFT JOIN assignment_submissions
ON students.id = assignment_submissions.student_id
WHERE students.end_date is NULL
GROUP BY students.name
ORDER BY average DESC;