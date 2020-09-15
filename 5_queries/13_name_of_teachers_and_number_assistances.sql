SELECT DISTINCT t.name as teacher,
co.name as cohort,
count(asr.*) as total_assistances
FROM cohorts co
JOIN students std ON std.cohort_id = co.id
JOIN assistance_requests asr ON asr.student_id = std.id
JOIN teachers t ON t.id = asr.teacher_id
WHERE co.name = 'JUL02'
GROUP BY t.name, co.name
ORDER BY t.name;