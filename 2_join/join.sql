SELECT students.name as students_name, email, cohorts.name as cohorts_name
FROM students LEFT OUTER JOIN cohorts ON cohort_id = cohorts.id
ORDER BY students.name;