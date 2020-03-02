SELECT name, email, phone
FROM students
WHERE end_date is not NULL
and github is NULL;