# Solid-Waste-Management-Data-Warehouse-and-Dashboard

Documentation and SQL script for a data warehousing project for a solid waste management company.


## Project Overview

This repository contains the documentation for a data warehousing project for a solid waste management company operating in Brazil.
The project involves the design and implementation of a data warehouse to analyze and report on waste collection data.
The data warehouse is created using `PostgreSQL`, and the project includes tasks related to schema design, data modeling, data loading, aggregation queries, and creation of Materialized Query Tables (MQTs).
The dashboard was created using `IBM Cognos Analytics` BI tool on cloud.


## Scenario
You are a data engineer hired by a solid waste management company. The company collects and recycles solid waste across major cities in the country of Brazil. The company operates hundreds of trucks of different types to collect and transport solid waste. The company would like to create a data warehouse so that it can create reports like:

- total waste collected per year per city.
- total waste collected per month per city.
- total waste collected per quarter per city.
- total waste collected per year per trucktype.
- total waste collected per trucktype per city.
- total waste collected per trucktype per station per city.

You will use your data warehousing skills to design and implement a data warehouse for the company.


## Prerequisites

Before starting the project, ensure you have the following:

- [PostgreSQL](https://www.postgresql.org/) installed for creating and managing the database.
- [pgAdmin 4](https://www.pgadmin.org/) or a similar tool for database management.
- Sample data provided in CSV format.


## Folder Structure

- `Dashboard/`: Generated dashboard in both `PNG` and `PDF` format.
- `datasets/`: Sample data files in CSV format.
- `results/`: Screenshots of SQL queries and charts.
- `sqlCommands.sql`: SQL script for creating database tables and queries.


## Database Schema

The database schema for this project is a `star` schema and consists of the following tables:

- `DimDate`: Contains date-related dimensions.
- `DimTruck`: Contains information about truck types.
- `DimStation`: Contains data about waste collection stations.
- `FactTrips`: Stores information about waste collection trips.


## Data Loading

Data from the provided CSV files was loaded into the database using the `COPY` command in SQL.

## Aggregation Queries

The project includes aggregation queries, such as grouping sets, rollup, and cube, to analyze waste collection data from different angles.

## Materialized Query Tables (MQTs)

A Materialized Query Table named `max_waste_stats` was created to store statistics related to waste collection.


## Dashboard Creation

Dashboard tasks involve creating visualizations like pie charts and bar charts to represent waste collection data.

- Task 17: Create a pie chart to show waste collected by truck type.
- Task 18: Create a bar chart to show waste collected station-wise.
- Task 19: Create a line chart to show waste collected by Date.
- Task 20: Create a pie chart to show waste collected by city.

Dashboard
![Dashboard](https://github.com/Farahat612/Solid-Waste-Management-Data-Warehouse-and-Dashboard/assets/67427124/4e4682b2-905c-4cb8-963c-8e0d096900d5)

You can access it in `PDF` format in the repository content.


## Contributing

Contributions to this project are welcome. If you would like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch: `$ git checkout -b my-new-branch`
3. Make your changes and commit them: `$ git commit -am 'Add some feature'`
4. Push the changes to your branch: `$ git push origin my-new-branch`
5. Submit a pull request detailing your changes.


## Known Issues or Limitations

Currently, there are no known issues or limitations with this project.


## Acknowledgments

This project was completed as part of an educational graded final assignment for `Getting Started with Data Warehousing and BI Analytics` course which is part of `IBM Data Engineer` Professional Certificate on Coursera. 


## License

This project is licensed under the [MIT License](LICENSE).
