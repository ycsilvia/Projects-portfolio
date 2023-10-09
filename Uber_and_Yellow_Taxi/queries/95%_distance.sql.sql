
WITH hired_trips AS (SELECT pickup_datetime, trip_distance as distance 
FROM taxi_trips 
WHERE pickup_datetime BETWEEN '2013-07-01' AND '2013-07-31'
UNION ALL
SELECT pickup_datetime, trip_distance as distance
FROM uber_trips
WHERE pickup_datetime BETWEEN '2013-07-01' AND '2013-07-31')
          
SELECT distance
FROM hired_trips
ORDER BY distance ASC
LIMIT 1

OFFSET (SELECT COUNT(*) FROM hired_trips) * 95 / 100 - 1 ;
          