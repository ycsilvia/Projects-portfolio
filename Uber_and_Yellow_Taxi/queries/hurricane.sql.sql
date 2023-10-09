
WITH hired_trips AS 
(SELECT strftime('%Y-%m-%d %H',pickup_datetime) AS date
FROM taxi_trips
WHERE pickup_datetime BETWEEN '2012-10-22' AND '2012-11-07'
UNION ALL
SELECT strftime('%Y-%m-%d %H',pickup_datetime) AS date
FROM uber_trips
WHERE pickup_datetime BETWEEN '2012-10-22' AND '2012-11-07')

SELECT strftime('%Y-%m-%d %H',hourly_weathers.date) AS w, COALESCE(COUNT(hired_trips.date),0) AS num, HourlyPrecipitation, HourlyWindSpeed
FROM hourly_weathers
LEFT JOIN hired_trips
ON w = hired_trips.date
WHERE w BETWEEN '2012-10-22' AND '2012-11-07'
GROUP BY w
