USE uber_analysis;

-- ==========================================
-- Basic KPIs
-- ==========================================

-- Total Rides
SELECT 
    COUNT(*) AS total_rides
FROM uber;

-- Total Revenue
SELECT 
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber;

-- Average Fare
SELECT 
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber;

-- Average Passengers
SELECT 
    ROUND(AVG(passenger_count), 2) AS average_passengers
FROM uber;

-- Highest Fare
SELECT 
    MAX(fare_amount) AS highest_fare
FROM uber;

-- Lowest Fare
SELECT 
    MIN(fare_amount) AS lowest_fare
FROM uber;

-- ==========================================
-- Hourly Ride Demand Analysis
-- ==========================================

-- Number of Rides by Pickup Hour
SELECT
    pickup_hour,
    COUNT(*) AS total_rides
FROM uber
GROUP BY pickup_hour
ORDER BY pickup_hour;

-- Total Revenue by Pickup Hour
SELECT
    pickup_hour,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY pickup_hour
ORDER BY pickup_hour;

-- Average Fare by Pickup Hour

SELECT
    pickup_hour,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber
GROUP BY pickup_hour
ORDER BY pickup_hour;

-- Average Passenger Count by Pickup Hour
SELECT
    pickup_hour,
    ROUND(AVG(passenger_count), 2) AS average_passengers
FROM uber
GROUP BY pickup_hour
ORDER BY pickup_hour;

-- Busiest Pickup Hour
SELECT
    pickup_hour,
    COUNT(*) AS total_rides
FROM uber
GROUP BY pickup_hour
ORDER BY total_rides DESC
LIMIT 1;

-- Least Busy Pickup Hour
SELECT
    pickup_hour,
    COUNT(*) AS total_rides
FROM uber
GROUP BY pickup_hour
ORDER BY total_rides ASC
LIMIT 1;

-- Percentage of Total Rides by Hour
SELECT
    pickup_hour,
    COUNT(*) AS total_rides,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM uber),
        2
    ) AS ride_percentage
FROM uber
GROUP BY pickup_hour
ORDER BY pickup_hour;

-- ==========================================
-- Weekday Analysis
-- ==========================================

-- Number of Rides by Weekday
SELECT
    pickup_day_name,
    COUNT(*) AS total_rides
FROM uber
GROUP BY pickup_day_name
ORDER BY pickup_day_name;

-- Total Revenue by Weekday
SELECT
    pickup_day_name,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY pickup_day_name
ORDER BY pickup_day_name;

-- Average Fare by Weekday
SELECT
    pickup_day_name,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber
GROUP BY pickup_day_name
ORDER BY pickup_day_name;

-- Average Passenger Count by Weekday
SELECT
    pickup_day_name,
    ROUND(AVG(passenger_count), 2) AS average_passengers
FROM uber
GROUP BY pickup_day_name
ORDER BY pickup_day_name;

-- Weekday vs Weekend Ride Count
SELECT
    day_type,
    COUNT(*) AS total_rides
FROM uber
GROUP BY day_type
ORDER BY day_type;

-- Weekday vs Weekend Revenue
SELECT
    day_type,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY day_type
ORDER BY day_type;

-- Busiest Weekday
SELECT
    pickup_day_name,
    COUNT(*) AS total_rides
FROM uber
GROUP BY pickup_day_name
ORDER BY total_rides DESC
LIMIT 1;

-- Highest Revenue Weekday
SELECT
    pickup_day_name,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY pickup_day_name
ORDER BY total_revenue DESC
LIMIT 1;

-- ==========================================
-- Monthly Analysis
-- ==========================================

-- Number of Rides by Month
SELECT
    pickup_month_name,
    COUNT(*) AS total_rides
FROM uber
GROUP BY pickup_month_name
ORDER BY pickup_month_name;

-- Total Revenue by Month
SELECT
    pickup_month_name,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY pickup_month_name
ORDER BY pickup_month_name;

-- Average Fare by Month
SELECT
    pickup_month_name,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber
GROUP BY pickup_month_name
ORDER BY pickup_month_name;

-- Average Passenger Count by Month
SELECT
    pickup_month_name,
    ROUND(AVG(passenger_count), 2) AS average_passengers
FROM uber
GROUP BY pickup_month_name
ORDER BY pickup_month_name;

-- Busiest Month
SELECT
    pickup_month_name,
    COUNT(*) AS total_rides
FROM uber
GROUP BY pickup_month_name
ORDER BY total_rides DESC
LIMIT 1;

-- Highest Revenue Month
SELECT
    pickup_month_name,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY pickup_month_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Percentage of Total Rides by Month
SELECT
    pickup_month_name,
    COUNT(*) AS total_rides,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM uber),
        2
    ) AS ride_percentage
FROM uber
GROUP BY pickup_month_name
ORDER BY pickup_month_name;

-- ==========================================
-- Passenger Analysis
-- ==========================================

-- Number of Rides by Passenger Count
SELECT
    passenger_count,
    COUNT(*) AS total_rides
FROM uber
GROUP BY passenger_count
ORDER BY passenger_count;

-- Total Revenue by Passenger Count
SELECT
    passenger_count,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY passenger_count
ORDER BY passenger_count;

-- Average Fare by Passenger Count
SELECT
    passenger_count,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber
GROUP BY passenger_count
ORDER BY passenger_count;

-- Passenger Count with Most Rides
SELECT
    passenger_count,
    COUNT(*) AS total_rides
FROM uber
GROUP BY passenger_count
ORDER BY total_rides DESC
LIMIT 1;

-- Passenger Count with Highest Revenue
SELECT
    passenger_count,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY passenger_count
ORDER BY total_revenue DESC
LIMIT 1;

-- Percentage of Total Rides by Passenger Count
SELECT
    passenger_count,
    COUNT(*) AS total_rides,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM uber),
        2
    ) AS ride_percentage
FROM uber
GROUP BY passenger_count
ORDER BY passenger_count;

-- Total Revenue and Average Fare by Passenger Count
SELECT
    passenger_count,
    ROUND(SUM(fare_amount), 2) AS total_revenue,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber
GROUP BY passenger_count
ORDER BY passenger_count;

-- ==========================================
-- Location Analysis
-- ==========================================

-- Total Rides by Pickup Location
SELECT
    pickup_latitude,
    pickup_longitude,
    COUNT(*) AS total_rides
FROM uber
GROUP BY pickup_latitude, pickup_longitude;

-- Total Rides by Dropoff Location
SELECT
    dropoff_latitude,
    dropoff_longitude,
    COUNT(*) AS total_rides
FROM uber
GROUP BY dropoff_latitude, dropoff_longitude;

-- Average Fare by Pickup Location
SELECT
    pickup_latitude,
    pickup_longitude,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber
GROUP BY pickup_latitude, pickup_longitude;

-- Highest Revenue Pickup Location
SELECT
    pickup_latitude,
    pickup_longitude,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY pickup_latitude, pickup_longitude
ORDER BY total_revenue DESC
LIMIT 1;

-- Highest Revenue Dropoff Location
SELECT
    dropoff_latitude,
    dropoff_longitude,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY dropoff_latitude, dropoff_longitude
ORDER BY total_revenue DESC
LIMIT 1;

-- Top 10 Busiest Pickup Locations
SELECT
    pickup_latitude,
    pickup_longitude,
    COUNT(*) AS total_rides
FROM uber
GROUP BY pickup_latitude, pickup_longitude
ORDER BY total_rides DESC
LIMIT 10;

-- Top 10 Busiest Dropoff Locations
SELECT
    dropoff_latitude,
    dropoff_longitude,
    COUNT(*) AS total_rides
FROM uber
GROUP BY dropoff_latitude, dropoff_longitude
ORDER BY total_rides DESC
LIMIT 10;

-- ==========================================
-- Business Insights
-- ==========================================

-- Hour Generating the Highest Revenue
SELECT
    pickup_hour,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY pickup_hour
ORDER BY total_revenue DESC
LIMIT 1;

-- Weekday Generating the Highest Revenue
SELECT
    pickup_day_name,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY pickup_day_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Month Generating the Highest Revenue
SELECT
    pickup_month_name,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY pickup_month_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Weekday vs Weekend Comparison
SELECT
    day_type,
    COUNT(*) AS total_rides,
    ROUND(SUM(fare_amount), 2) AS total_revenue,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber
GROUP BY day_type
ORDER BY day_type;

-- Passenger Count Generating the Highest Revenue
SELECT
    passenger_count,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY passenger_count
ORDER BY total_revenue DESC
LIMIT 1;

-- Top 5 Pickup Locations by Revenue
SELECT
    pickup_latitude,
    pickup_longitude,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM uber
GROUP BY pickup_latitude, pickup_longitude
ORDER BY total_revenue DESC
LIMIT 5;

-- Overall Business Summary
SELECT
    COUNT(*) AS total_rides,
    ROUND(SUM(fare_amount), 2) AS total_revenue,
    ROUND(AVG(fare_amount), 2) AS average_fare,
    ROUND(AVG(passenger_count), 2) AS average_passengers,
    MAX(fare_amount) AS highest_fare,
    MIN(fare_amount) AS lowest_fare
FROM uber;