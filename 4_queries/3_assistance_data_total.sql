SELECT teachers.name as teacher, students.name as student, assignments.name as ass_name, (assistance_requests.completed_at - assistance_requests.started_at) as help_time
FROM 
    assistance_requests LEFT JOIN teachers on assistance_requests.teacher_id = teachers.id
    LEFT JOIN students on assistance_requests.student_id = students.id
    LEFT JOIN assignments on assistance_requests.assignment_id = assignments.id
order by help_time;