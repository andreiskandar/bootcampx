const { Client } = require('pg');

const config = {
	user: 'vagrant',
	database: 'bootcampx',
	password: '123',
	host: 'localhost',
	PORT: 5432,
};

const client = new Client(config);

client.connect(() => console.log('connected'));

const cohort = process.argv[2];
client
	.query(
		`
SELECT DISTINCT t.name as teacher,
co.name as cohort
FROM cohorts co
JOIN students std ON std.cohort_id = co.id
JOIN assistance_requests asr ON asr.student_id = std.id
JOIN teachers t ON t.id = asr.teacher_id
WHERE co.name = '${process.argv[2] || 'JUL02'}'
ORDER BY t.name;`
	)
	.then((res) => {
		res.rows.forEach((el) => {
			console.log(`${el.cohort}: ${el.teacher}`);
		});
		client.end();
	});
