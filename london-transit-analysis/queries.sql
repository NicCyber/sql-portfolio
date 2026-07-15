-- ============================================
-- London Transit Analysis
-- Dataset: tfl.rods
-- Author: Nicolas Iodice
-- Description:
-- SQL queries used to analyze ridership,
-- travel behavior, and commuting patterns
-- in the London Underground system.
-- ============================================

------------------------------------------------
-- Total daily journeys
------------------------------------------------

SELECT
    SUM(daily_journeys) AS total_journeys
FROM tfl.rods;

------------------------------------------------
-- Total journeys by entry zone
------------------------------------------------

SELECT
    entry_zone,
    SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY entry_zone
ORDER BY entry_zone;

------------------------------------------------
-- Total journeys by time period
------------------------------------------------

SELECT
    time_period,
    SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY time_period
ORDER BY time_period;

------------------------------------------------
-- Journeys by origin purpose
------------------------------------------------

SELECT
    origin_purpose,
    SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY origin_purpose
ORDER BY total_journeys DESC;

------------------------------------------------
-- Journeys by origin and destination purpose
------------------------------------------------

SELECT
    origin_purpose,
    destination_purpose,
    SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY
    origin_purpose,
    destination_purpose
ORDER BY total_journeys DESC;

------------------------------------------------
-- Journeys by origin purpose and time period
------------------------------------------------

SELECT
    origin_purpose,
    time_period,
    SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY
    origin_purpose,
    time_period
ORDER BY
    origin_purpose,
    time_period;

------------------------------------------------
-- Journeys by origin purpose and entry zone
------------------------------------------------

SELECT
    origin_purpose,
    entry_zone,
    SUM(daily_journeys) AS total_journeys
FROM tfl.rods
GROUP BY
    origin_purpose,
    entry_zone
ORDER BY
    entry_zone,
    origin_purpose;

------------------------------------------------
-- Tourism-related journeys
------------------------------------------------

SELECT
    origin_purpose,
    destination_purpose,
    time_period,
    SUM(daily_journeys) AS total_journeys
FROM tfl.rods
WHERE
    origin_purpose = 'Tourist'
    OR destination_purpose = 'Tourist'
GROUP BY
    origin_purpose,
    destination_purpose,
    time_period
ORDER BY total_journeys DESC;
