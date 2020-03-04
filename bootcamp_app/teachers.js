const { Pool } = require('pg');

const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});



let argv = process.argv.slice(2);

pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
LEFT JOIN assistance_requests on assistance_requests.teacher_id = teachers.id 
LEFT JOIN students on assistance_requests.student_id = students.id 
LEFT JOIN cohorts on cohorts.id = students.cohort_id
WHERE cohorts.name = '${argv[0]}'
ORDER BY teachers.name;
`).then(res => {
  for(let item of res.rows) {    
    console.log(`${item.cohort}: ${item.teacher}`);
  }
})
.catch(err => console.error('query error', err.stack))

