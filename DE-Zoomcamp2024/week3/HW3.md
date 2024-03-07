## Module 3 Homework

<b><u>Important Note:</b></u> <p> For this homework we will be using the 2022 Green Taxi Trip Record Parquet Files from the New York
City Taxi Data found here: </br> https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page </br>
If you are using orchestration such as Mage, Airflow or Prefect do not load the data into Big Query using the orchestrator.</br> 
Stop with loading the files into a bucket. </br></br>
<u>NOTE:</u> You will need to use the PARQUET option files when creating an External Table</br>

<b>SETUP:</b></br>
Create an external table using the Green Taxi Trip Records Data for 2022. </br>
Create a table in BQ using the Green Taxi Trip Records for 2022 (do not partition or cluster this table). </br>
</p>

Step 1 - Load green data into cloud storage

- download the data localy from the following link into folder "green_tripdata_2022":
https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2022-{month}.parquet

- Load the data directly to cloud storage without any transformation

- load_data_to_gcp.py
- google credential.json file

```
pip install google-cloud-storage
set GOOGLE_APPLICATION_CREDENTIALS="C:\Users\Silvia\Downloads\windy-winter-398119-0f9bd985685c.json"
python load_data_to_gcp.py
```

Step 2 - Explore in BigQuery

-bigquery-hw.sql

## Question 1:
Question 1: What is count of records for the 2022 Green Taxi Data??
- 840,402

## Question 2:
Write a query to count the distinct number of PULocationIDs for the entire dataset on both the tables.</br> 
What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?

- 0 MB for the External Table and 6.41MB for the Materialized Table


## Question 3:
How many records have a fare_amount of 0?
- 1,622

## Question 4:
What is the best strategy to make an optimized table in Big Query if your query will always order the results by PUlocationID and filter based on lpep_pickup_datetime? (Create a new table with this strategy)
- Partition by lpep_pickup_datetime  Cluster on PUlocationID

## Question 5:
Write a query to retrieve the distinct PULocationID between lpep_pickup_datetime
06/01/2022 and 06/30/2022 (inclusive)</br>

Use the materialized table you created earlier in your from clause and note the estimated bytes. Now change the table in the from clause to the partitioned table you created for question 4 and note the estimated bytes processed. What are these values? </br>

Choose the answer which most closely matches.</br> 

- 12.82 MB for non-partitioned table and 1.12 MB for the partitioned table


## Question 6: 
Where is the data stored in the External Table you created?

- GCP Bucket


## Question 7:
It is best practice in Big Query to always cluster your data:
- False


## (Bonus: Not worth points) Question 8:
No Points: Write a `SELECT count(*)` query FROM the materialized table you created. How many bytes does it estimate will be read? Why?

- 0 (in metadata, we can see how many rows in total.)
 
## Submitting the solutions

* Form for submitting: https://courses.datatalks.club/de-zoomcamp-2024/homework/hw3