SELECT students.name, AVG(assignment_submissions.duration) as average_duration, AVG(assignments.duration) as est_duration
FROM students 
LEFT JOIN assignment_submissions ON students.id = assignment_submissions.student_id
LEFT JOIN assignments ON assignments.id = assignment_submissions.assignment_id
WHERE students.end_date is NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_duration;