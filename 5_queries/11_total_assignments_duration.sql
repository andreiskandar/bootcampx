SELECT day, count(asg.id) as number_of_assignments, SUM(duration) as duration
FROM assignments asg
GROUP BY day
ORDER BY day;