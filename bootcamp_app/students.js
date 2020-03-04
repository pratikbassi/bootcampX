const { Pool } = require('pg');

const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});



let argv = process.argv.slice(2);

pool.query(`
SELECT students.id, students.name as student, cohorts.name as cohort
FROM STUDENTS
LEFT JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${argv[0]}%'
LIMIT ${argv[1]}
`).then(res => {
  for(let item of res.rows) {
    let student = item['student'];
    let studentID = item['id'];
    let cohort = item['cohort'];
    console.log(`${student} has an id of ${studentID} and was in the ${cohort} cohort`);
  }
})
.catch(err => console.error('query error', err.stack))

