const { Pool } = require('pg');

const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});



const cohortName = process.argv[2];

const values = [`${cohortName}`];
const queryString = `
  SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM teachers
  LEFT JOIN assistance_requests on assistance_requests.teacher_id = teachers.id 
  LEFT JOIN students on assistance_requests.student_id = students.id 
  LEFT JOIN cohorts on cohorts.id = students.cohort_id
  WHERE cohorts.name = $1
  ORDER BY teachers.name;
  `;

pool.query(queryString, values, (err, res) => {

  if(err) {
    console.log(err.stack)
  }
  for(let item of res.rows) {    
    console.log(`${item.cohort}: ${item.teacher}`);
  }
})

