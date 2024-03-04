variable "credentials" {
  description = "My Credentials"
  default     = "./keys/my-creds.json"
}

variable "project" {
  description = "Project"
  default     = "windy-winter-398119"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default = "us-central1"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default = "US"
}

variable "bq_dataset_name" {
  description = "BigQuery Dataset Name for Week-1 Homework"
  #Update the below to what you want your dataset to be called
  default = "hw1_dataset"
}

variable "gcs_bucket_name" {
  description = "Storage Bucket Name for Week-1 Homework"
  #Update the below to a unique bucket name
  default = "windy-winter-398119-hw1-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}
