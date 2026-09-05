CREATE TABLE analytics.cyclistic_ride_type_summary AS
SELECT
    member_casual,
    rideable_type,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_length_min), 1) AS avg_ride_length_min
FROM staging.cyclistic_trips
GROUP BY member_casual, rideable_type;