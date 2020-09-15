SELECT co.name as name, 
avg(completed_at - started_at) as average_assistance_request_duration
FROM assistance_requests
JOIN students std ON std.id = student_id
JOIN cohorts co ON co.id = std.cohort_id
GROUP BY co.name
ORDER BY average_assistance_request_duration;