CREATE TABLE analytics.cyclistic_rides_summary AS
SELECT
    member_casual,
    day_of_week,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_length_min), 1) AS avg_ride_length_min
FROM staging.cyclistic_trips
GROUP BY member_casual, day_of_week;
