CREATE TABLE staging.cyclistic_trips AS
SELECT DISTINCT ON (ride_id)
    ride_id,
    rideable_type,
    member_casual,
    started_at,
    ended_at,
    EXTRACT(EPOCH FROM (ended_at - started_at)) / 60.0 AS ride_length_min,
    TO_CHAR(started_at, 'FMDay') AS day_of_week,
    start_station_id,
    end_station_id
FROM raw.cyclistic_trips
WHERE started_at IS NOT NULL
  AND ended_at IS NOT NULL
  AND ended_at > started_at
ORDER BY ride_id, started_at;