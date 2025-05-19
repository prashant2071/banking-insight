
# Automated Etl data pipeline for banking data

A data pipeline project using DBT and Apache Airflow to extract and model raw banking data into actionable insights. This project builds staging and intermediate models to analyze customer transactions, account activity, and mobile banking behavior in a PostgreSQL environment .This work on a principle of 

## Technologies used
    - Airflow
    - DBT

## Airflow 
Managed by Apache Airflow for reliable and scalable execution
## DBT 
DBT is a data build tool for transforming raw data into useful information .

## Features
#### This ETL project contains the following features :
 - Fetching data: Fetching the data from the source
 - Data Transformation : Cleaning and Transforming the data into specific columns. And, converting the extracted data and reflect into visualization  tool.

 - Orchestration : Managed by Apache Airflow for reliable and scalable execution.

### Prerequisites
 - PostgreSQL Database : Ensure PostgreSQL is installed and running.

 - Airflow : Apache Airflow is used for Orchestration.

 - Docker : for Containering the docker image

Airflow Docker Image
Python Libraries : The following libraries has been used
- python 
- dbt-core
- dbt-postgres

### Initializing project 
  ```http
        dbt init : initalizing the project and add require crediantials
```

####  Working architecture  of our project is medallian architecture 
- raw layer : where data comes from raw source
- silver layer : where data is cleaned and remove duplicate data and data type is preserve here
- golden layer : where silver data is converted into useful insight where data is used using aggregation function