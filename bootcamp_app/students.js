const { Pool } = require('pg');

const config = {
	user: 'vagrant',
	password: '123',
	host: 'localhost',
	database: 'bootcampx',
	port: 5432,
};

const pool = new Pool(config);

pool.connect(() => {
	console.log('connected to the database');
});

pool
	.query(
		`SELECT students.id, students.name as name,
    cohorts.name as cohort_name
    FROM students
    JOIN cohorts on cohorts.id = cohort_id
    LIMIT 5;`
	)
	.then((res) => {
		res.rows.forEach((student) => {
			console.log(
				`${student.name} has an id of ${student.id} and was in the ${student.cohort_name} cohort`
			);
		});
		pool.end().then((res) => console.log('pool is ended'));
	});

const cohortName = process.argv[2];
const limit = process.argv[3];

pool
	.query(
		`
  SELECT students.id,
  students.name as name,
  cohorts.name as cohort
  FROM students
  JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE cohorts.name LIKE '${cohortName}%'
  LIMIT ${limit}`
	)
	.then((res) => {
		res.rows.forEach((student) =>
			console.log(
				`${student.name} has an id of ${student.id} and was in the ${student.cohort} cohort`
			)
		);
	})
	.catch((err) => console.error('query error', err.stack));
