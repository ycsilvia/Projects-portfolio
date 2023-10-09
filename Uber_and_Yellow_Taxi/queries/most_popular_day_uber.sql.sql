
SELECT strftime ('%w',pickup_datetime) AS Day,
COUNT(strftime ('%w',pickup_datetime)) AS Trip_counts
FROM uber_trips
GROUP BY Day
ORDER BY Trip_counts DESC
