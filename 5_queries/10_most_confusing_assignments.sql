SELECT asg.id, asg.name, asg.day, asg.chapter, count(asr.*) as total_requests
FROM assignments asg
JOIN assistance_requests asr ON asg.id = asr.assignment_id
GROUP BY asg.id
ORDER BY total_requests DESC; 