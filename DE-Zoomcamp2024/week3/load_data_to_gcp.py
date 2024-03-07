import os
from google.cloud import storage


def write_to_bucket(filename, bucket_name, folder_name):
    """Write green data parquet file into the given bucket"""
    # Instasiate a client
    storage_client = storage.Client()
    bucket = storage_client.get_bucket(bucket_name)

    sub_file = filename.split('/')
    # The destination blob is just the name of our file into cloud storage
    destination_blob = bucket.blob(f'{folder_name}/{sub_file[-1]}')

    destination_blob.upload_from_filename(filename)
    print(f"file {filename} uploaded to {destination_blob}")


def extract_data(url, month):
    """Doanload the data from the url localy"""
    file_name = f"C:/Users/Silvia/Downloads/green_tripdata_2022/green_tripdata_2022-{month}.parquet"
    os.system(f'curl -o {url} -O {file_name}')
    return file_name


def main():
    """Main for the program"""
    # Name of the bucket
    bucket_name = 'de-hw3'
    # folder name
    folder_name = 'green_data_2022'
    semi_url = "https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2022"
    months = ['01', '02', '03', '04', '05', '06',
              '07', '08', '09', '10', '11', '12']
    for month in months:
        url = f"{semi_url}-{month}.parquet"
        filename = extract_data(url, month)
        write_to_bucket(filename, bucket_name, folder_name)


if __name__ == "__main__":
    main()
