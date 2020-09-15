SELECT count(asst.id) as total_assistances, t.name
FROM assistance_requests asst
JOIN teachers t ON t.id = teacher_id
WHERE t.name='Waylon Boehm'
GROUP BY t.name;