SELECT count(asst.*) as total_assistances, std.name
FROM assistance_requests asst
JOIN students std ON std.id = student_id
WHERE std.name='Elliot Dickinson'
GROUP BY std.name;