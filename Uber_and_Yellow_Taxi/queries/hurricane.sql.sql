
SELECT weathers.DATE, weathers.HOUR, weathers.HourlyPrecipitation, weathers.HourlyWindSpeed, trips.numbers
FROM
(
SELECT strftime ('%Y-%m-%d',Date) AS DATE, strftime ('%H',Date) AS HOUR, HourlyPrecipitation, HourlyWindSpeed
FROM hourly_weathers 
WHERE DATE BETWEEN '2012-10-22' AND '2012-11-07'
GROUP BY strftime ('%Y-%m-%d',Date), strftime ('%H', Date), HourlyPrecipitation, HourlyWindSpeed
) weathers
LEFT JOIN
(
SELECT strftime ('%Y-%m-%d',pickup_datetime) AS DATE, strftime ('%H',pickup_datetime) AS HOUR, COUNT(strftime ('%H',pickup_datetime)) as numbers FROM taxi_trips
WHERE DATE BETWEEN '2012-10-22' AND '2012-11-07'
GROUP BY strftime ('%Y-%m-%d',pickup_datetime), strftime ('%H',pickup_datetime) 
union all
SELECT strftime ('%Y-%m-%d',pickup_datetime) AS DATE, strftime ('%H',pickup_datetime) AS HOUR, COUNT(strftime ('%H',pickup_datetime)) as numbers FROM uber_trips
WHERE DATE BETWEEN '2012-10-22' AND '2012-11-07'
GROUP BY strftime ('%Y-%m-%d',pickup_datetime), strftime ('%H',pickup_datetime) 
) trips
ON trips.DATE = weathers.DATE AND trips.HOUR = weathers.HOUR
GROUP BY weathers.DATE, weathers.HOUR, weathers.HourlyPrecipitation, weathers.HourlyWindSpeed, trips.numbers
