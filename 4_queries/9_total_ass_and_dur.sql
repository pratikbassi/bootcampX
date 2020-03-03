SELECT day, count(day) AS number_of_ass, sum(duration) 
FROM assignments
GROUP BY day 
ORDER BY day;