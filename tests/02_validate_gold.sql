-- =====================================================
-- Cyclistic Gold Layer Validation
-- =====================================================

-- Validate weekday summary
SELECT *
FROM analytics.cyclistic_rides_summary
ORDER BY member_casual, day_of_week;


-- Expected: 14 rows
-- 2 rider types x 7 weekdays
SELECT COUNT(*) AS summary_row_count
FROM analytics.cyclistic_rides_summary;


-- Validate ride type summary
SELECT *
FROM analytics.cyclistic_ride_type_summary
ORDER BY member_casual, rideable_type;


-- Check number of rider/bike type combinations
SELECT COUNT(*) AS ride_type_summary_row_count
FROM analytics.cyclistic_ride_type_summary;