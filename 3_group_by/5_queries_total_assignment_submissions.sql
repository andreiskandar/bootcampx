SELECT cohorts.name, 
COUNT(assignment_submissions.*) as total_submissions
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
GROUP BY cohorts.name
ORDER BY COUNT(assignment_submissions.*) DESC