
SELECT strftime ('%Y-%m-%d',pickup_datetime) AS DAY,
AVG(trip_distance)
FROM uber_trips
WHERE pickup_datetime between '2009-01-01' AND '2009-12-31'
GROUP BY DAY
ORDER BY COUNT(strftime ('%Y-%m-%d',pickup_datetime)) DESC
LIMIT 10
