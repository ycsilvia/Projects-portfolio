
SELECT distance FROM(
SELECT trip_distance AS distance
FROM (SELECT pickup_datetime, trip_distance, pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude from taxi_trips
WHERE pickup_datetime between '2013-07-01' AND '2013-07-31'
union all
SELECT pickup_datetime, trip_distance, pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude from uber_trips)
WHERE pickup_datetime between '2013-07-01' AND '2013-07-31'
)
ORDER BY distance ASC
LIMIT 1
OFFSET (SELECT count(*)
FROM (SELECT trip_distance AS distance
FROM (SELECT pickup_datetime, trip_distance, pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude from taxi_trips
WHERE pickup_datetime between '2013-07-01' AND '2013-07-31'
union all
SELECT pickup_datetime, trip_distance, pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude from uber_trips)
WHERE pickup_datetime between '2013-07-01' AND '2013-07-31'
)) * 95 / 100 -1
