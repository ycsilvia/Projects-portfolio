create or replace external table `windy-winter-398119.ny_taxi.external_green_tripdata_2022`
options (
  format = 'PARQUET',
  uris = ['gs://de-hw3/green_data_2022/green_tripdata_2022-*.parquet']
);

create or replace table `windy-winter-398119.ny_taxi.materialized_green_tripdata_2022` as (
  select * from `windy-winter-398119.ny_taxi.external_green_tripdata_2022`
);

SELECT count(*) FROM `windy-winter-398119.ny_taxi.external_green_tripdata_2022`;

SELECT COUNT(DISTINCT(PULocationID)) FROM `windy-winter-398119.ny_taxi.external_green_tripdata_2022`;

SELECT COUNT(DISTINCT(PULocationID)) FROM `windy-winter-398119.ny_taxi.materialized_green_tripdata_2022`;

select count(*) from `windy-winter-398119.ny_taxi.external_green_tripdata_2022`
where fare_amount = 0;

create or replace table `windy-winter-398119.ny_taxi.external_green_tripdata_2022_clustered` 
partition by date (lpep_pickup_datetime) 
cluster by PUlocationID as (
  select * from `windy-winter-398119.ny_taxi.external_green_tripdata_2022`
);

select distinct PUlocationID
from `windy-winter-398119.ny_taxi.materialized_green_tripdata_2022`
where date(lpep_pickup_datetime) between '2022-06-01' and '2022-06-30';

select distinct PUlocationID
from `windy-winter-398119.ny_taxi.external_green_tripdata_2022_clustered`
where date(lpep_pickup_datetime) between '2022-06-01' and '2022-06-30';