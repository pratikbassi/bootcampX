const { Pool } = require('pg');

const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});



let cohort = `%${process.argv[2]}%`;
let limit = process.argv[3]
let values = [cohort, limit]
const queryString = `
  SELECT students.id, students.name as student, cohorts.name as cohort
  FROM STUDENTS
  LEFT JOIN cohorts ON students.cohort_id = cohorts.id
  WHERE cohorts.name LIKE $1
  LIMIT $2
  `;

pool.query(queryString, values).then(res => {
  for(let item of res.rows) {
    let student = item['student'];
    let studentID = item['id'];
    let cohort = item['cohort'];
    console.log(`${student} has an id of ${studentID} and was in the ${cohort} cohort`);
  }
})
.catch(err => console.error('query error', err.stack))

