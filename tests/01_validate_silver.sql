-- =====================================================
-- Cyclistic Silver Layer Validation
-- =====================================================

-- Raw row count: 5,932,349
SELECT COUNT(*) AS raw_row_count
FROM raw.cyclistic_trips;


-- Staging row count: 5,932,285
SELECT COUNT(*) AS staging_row_count
FROM staging.cyclistic_trips;


-- Duplicate rows removed: 35
SELECT SUM(occurrences - 1) AS duplicate_rows_removed
FROM (
    SELECT ride_id, COUNT(*) AS occurrences
    FROM raw.cyclistic_trips
    GROUP BY ride_id
    HAVING COUNT(*) > 1
) AS duplicates;


-- NULL timestamps found: 0
SELECT
    COUNT(*) FILTER (WHERE started_at IS NULL) AS started_at_nulls,
    COUNT(*) FILTER (WHERE ended_at IS NULL) AS ended_at_nulls
FROM raw.cyclistic_trips;


-- Invalid ride durations removed: 29
-- These rows have ended_at earlier than or equal to started_at.
SELECT COUNT(*) AS invalid_time_rows
FROM raw.cyclistic_trips
WHERE ended_at <= started_at;


-- Validation summary:
-- 5,932,349 raw rows
--      - 35 duplicate rows
--      - 29 invalid-duration rows
-- = 5,932,285 staging rows