SELECT t.name as teacher, 
std.name as student, 
asg.name as assignment, 
asst.completed_at - asst.created_at as duration
FROM assistance_requests asst
JOIN teachers t ON t.id = teacher_id
JOIN students std ON std.id = student_id
JOIN assignments asg ON asg.id = assignment_id
ORDER BY duration
