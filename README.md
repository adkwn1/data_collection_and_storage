## Data Collection and Storage
Author: Andrew Kwon

## Description
This project demonstrates data collection from various sources, then conducts analysis and hypothesis testing on the results. Main tasks include SQL database queries, parsing an HTML GET request from an online source, and data visualization and analysis in Jupyter notebook. The database is unavailable for public use. As such, the following files are included for demonstrative purposes:

- **ride_info_collection.sql**: PostgreSQL script containing the queries used to build the resulting tables (see Datasets) for our analysis. Tasks described in comment sections.
- **er_diagram.png**: Entity Relationship diagram of the database.  
- **wx_records_collection.py**: Python script used to parse HTML GET request from an online source of weather information. Results already stored in database, script simply prints a sample result of the resulting table.

## Introduction
In this project, we work as an analyst for a new ride-sharing company that's launching in Chicago. Our task is to find patterns in the available information in order to understand passenger preferences and the impact of external factors on rides. Working with a database, we'll analyze data from competitors and test a hypothesis about the impact of weather on ride frequency. The goal of the analysis is to provide insight on weather impacts and recommend route priorities.

## Datasets
### Weather Information
- https://code.s3.yandex.net/data-analyst-eng/chicago_weather_2017.html

### Database
**neighborhoods table**: data on city neighborhoods
- *neighborhood_id*: neighborhood code (PK)
- *name*: name of the neighborhood

**cabs table**: data on taxis
- *cab_id*: vehicle code (PK)
- *vehicle_id*: the vehicle's technical ID
- *company_name*: the company that owns the vehicle

**trips table**: data on rides
- *trip_id*: ride code (PK)
- *cab_id*: code of the vehicle operating the ride (FK)
- *start_ts*: date and time of the beginning of the ride (time rounded to the hour)
- *end_ts*: date and time of the end of the ride (time rounded to the hour)
- *duration_seconds*: ride duration in seconds
- *distance_miles*: ride distance in miles
- *pickup_location_id*: pickup neighborhood code (FK)
- *dropoff_location_id*: dropoff neighborhood code (FK)

**weather_records table**: data on weather
- *record_id*: weather record code (PK)
- *ts*: record date and time (time rounded to the hour)
- *temperature*: temperature when the record was taken
- *description*: brief description of weather conditions, e.g. "light rain" or "scattered clouds"

**ER Diagram**
![er_diagram](https://github.com/adkwn1/data_collection_and_storage/assets/119823114/9744b268-40fe-47ca-9369-8d457b050804)

### DB Query Results
**project_sql_result_01.csv**  
- *company_name*: taxi company name  
- *trips_amount*: the number of rides for each taxi company on November 15-16, 2017

**project_sql_result_04.csv**  
- *dropoff_location_name*: Chicago neighborhoods where rides ended  
- *average_trips*: the average number of rides that ended in each neighborhood in November 2017  

**project_sql_result_07.csv**  
- *start_ts*: pickup date and time (only includes Saturdays for Novemeber 2017)
- *weather_conditions*: weather conditions at the moment the ride started  
- *duration_seconds*: ride duration in seconds

## Required Libraries
For analysis and hypothesis testing in Jupyter notebook:
- pandas
- seaborn
- scipy.stats

## Screenshots
![2b35ea9b-40a9-46bf-bd01-490fc6c5bad2](https://github.com/adkwn1/data_collection_and_storage/assets/119823114/2ccc9591-afb3-4c56-aef6-829bd806ca22)
![f02c68db-d868-4692-bd8c-4e44e9d7de8f](https://github.com/adkwn1/data_collection_and_storage/assets/119823114/b8b148c7-296d-44fb-beaa-bd42e64000a0)


