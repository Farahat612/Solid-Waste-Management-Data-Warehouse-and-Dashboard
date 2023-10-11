-- SQL CODE FOR EXERCISE 02


CREATE TABLE MyDimDate (
    dateid serial PRIMARY KEY,
    date date NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    monthname text NOT NULL,
    day integer NOT NULL,
    dayofweek integer NOT NULL,
    dayname text NOT NULL,
    quarter integer NOT NULL
);

CREATE TABLE MyDimWaste (
    wasteid serial PRIMARY KEY,
    waste_type text NOT NULL,
    waste_description text,
    waste_category text
);

CREATE TABLE MyDimZone (
    zoneid serial PRIMARY KEY,
    zone_name text NOT NULL,
    city text NOT NULL,
    country text
);


CREATE TABLE MyFactTrips (
    trip_number serial PRIMARY KEY,
    date_id integer NOT NULL,
    waste_type_id integer NOT NULL,
    zone_id integer NOT NULL,
    waste_collected_tons numeric NOT NULL,
    collection_station text
);

-- -----------------------------------------------------
-- SQL CODE FOR EXERCISE 03

CREATE TABLE DimDate (
    dateid serial PRIMARY KEY,
    date date NOT NULL,
    year integer NOT NULL,
    quarter integer NOT NULL,
    quartername text NOT NULL,
    month integer NOT NULL,
    monthname text NOT NULL,
    day integer NOT NULL,
    weekday integer NOT NULL,
    weekdayname text NOT NULL
);


CREATE TABLE DimTruck (
    truckid serial PRIMARY KEY,
    trucktype text NOT NULL
);


CREATE TABLE DimStation (
    stationid serial PRIMARY KEY,
    city text NOT NULL
);


CREATE TABLE FactTrips (
    tripid serial PRIMARY KEY,
    dateid integer NOT NULL,
    stationid integer NOT NULL,
    truckid integer NOT NULL,
    wastecollected numeric NOT NULL
);



-- -----------------------------------------------------
-- SQL CODE FOR EXERCISE 04

-- creating a grouping sets query using the columns stationid, trucktype, and total waste collected
SELECT
    stationid,
    trucktype,
    SUM(wastecollected) AS "Total Waste Collected"
FROM FactTrips
INNER JOIN DimTruck ON FactTrips.truckid = DimTruck.truckid
GROUP BY GROUPING SETS ((stationid, trucktype), (stationid), (trucktype));


-- creating a rollup query using the columns year, city, stationid, and total waste collected
SELECT
    year,
    city,
    FactTrips.stationid,
    SUM(wastecollected) AS "Total Waste Collected"
FROM FactTrips
INNER JOIN DimDate ON FactTrips.dateid = DimDate.dateid
INNER JOIN DimStation ON FactTrips.stationid = DimStation.stationid
GROUP BY ROLLUP (year, city, FactTrips.stationid);


-- creating a cube query using the columns year, city, stationid, and average waste collected
SELECT
    year,
    city,
    FactTrips.stationid,
    AVG(wastecollected) AS "Average Waste Collected"
FROM FactTrips
INNER JOIN DimDate ON FactTrips.dateid = DimDate.dateid
INNER JOIN DimStation ON FactTrips.stationid = DimStation.stationid
GROUP BY CUBE (year, city, FactTrips.stationid);


-- creating a Materialized Query Table (MQT) named max_waste_stats with the columns city, stationid, trucktype, and max waste collected
CREATE MATERIALIZED VIEW max_waste_stats AS
SELECT
    DimStation.city,
    FactTrips.stationid,
    DimTruck.trucktype,
    MAX(FactTrips.wastecollected) AS "Max Waste Collected"
FROM FactTrips
INNER JOIN DimStation ON FactTrips.stationid = DimStation.stationid
INNER JOIN DimTruck ON FactTrips.truckid = DimTruck.truckid
GROUP BY DimStation.city, FactTrips.stationid, DimTruck.trucktype;







