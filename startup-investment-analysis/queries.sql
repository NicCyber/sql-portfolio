-- ============================================
-- Startup Investment Analysis
-- Dataset: crunchbase.companies
-- Author: Nicolas Iodice
-- Description:
-- SQL queries used to analyze startup funding,
-- company status, and industry trends.
-- ============================================

------------------------------------------------
-- Top 12 companies by total funding
------------------------------------------------

SELECT
    name,
    category_code,
    status,
    funding_total_usd
FROM crunchbase.companies
WHERE funding_total_usd IS NOT NULL
ORDER BY funding_total_usd DESC
LIMIT 12;

------------------------------------------------
-- Top funded companies with a closed status
------------------------------------------------

SELECT
    name,
    category_code,
    status,
    funding_total_usd
FROM crunchbase.companies
WHERE funding_total_usd IS NOT NULL
    AND status = 'closed'
ORDER BY funding_total_usd DESC
LIMIT 12;

------------------------------------------------
-- All companies in the cleantech industry
------------------------------------------------

SELECT
    name,
    category_code,
    status
FROM crunchbase.companies
WHERE category_code = 'cleantech';

------------------------------------------------
-- Closed companies in the cleantech industry
------------------------------------------------

SELECT
    name,
    category_code,
    status
FROM crunchbase.companies
WHERE category_code = 'cleantech'
    AND status = 'closed';

------------------------------------------------
-- Cleantech companies with
-- Solar, Power, or Energy in the name
------------------------------------------------

SELECT
    name,
    category_code,
    status
FROM crunchbase.companies
WHERE category_code = 'cleantech'
    AND (
        name ILIKE '%solar%'
        OR name ILIKE '%power%'
        OR name ILIKE '%energy%'
    );
