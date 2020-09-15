SELECT DISTINCT t.name as teacher,
co.name as cohort
FROM cohorts co
JOIN students std ON std.cohort_id = co.id
JOIN assistance_requests asr ON asr.student_id = std.id
JOIN teachers t ON t.id = asr.teacher_id
WHERE co.name = 'JUL02'
ORDER BY t.name;