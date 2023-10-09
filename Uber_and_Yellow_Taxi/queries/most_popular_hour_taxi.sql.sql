
SELECT strftime ('%H',pickup_datetime) AS HOUR,
COUNT(strftime ('%H',pickup_datetime)) AS Trip_counts
FROM taxi_trips
GROUP BY HOUR
ORDER BY Trip_counts DESC
