
SELECT DAY, COUNT(*) FROM
(SELECT strftime('%Y-%m-%d', pickup_datetime) as DAY from taxi_trips
UNION ALL
SELECT strftime('%Y-%m-%d', pickup_datetime) as DAY from uber_trips)
WHERE DAY IN (SELECT strftime ('%Y-%m-%d', DAY) AS DAY FROM daily_weathers
WHERE DAY between '2014-01-01' AND '2014-12-31'
ORDER BY (DailyAverageWindSpeed) DESC
LIMIT 10)
GROUP BY DAY
