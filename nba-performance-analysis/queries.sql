-- ============================================
-- NBA Performance Analysis
-- Dataset: nba.games
-- Author: Nicolas Iodice
-- Description:
-- SQL queries used to analyze NBA scoring,
-- home-court advantage, three-point shooting,
-- and team performance from 2004 to 2020.
-- ============================================

------------------------------------------------
-- Dataset overview
------------------------------------------------

SELECT
    COUNT(*) AS total_games,
    MIN(season) AS first_season,
    MAX(season) AS last_season
FROM nba.games;

------------------------------------------------
-- Overall scoring averages and home win rate
------------------------------------------------

SELECT
    AVG(pts_home) AS avg_home_score,
    AVG(pts_away) AS avg_away_score,
    AVG(home_team_win) AS avg_home_win_rate
FROM nba.games;

------------------------------------------------
-- Scoring averages and home win rate by season
------------------------------------------------

SELECT
    season,
    AVG(pts_home) AS avg_home_score,
    AVG(pts_away) AS avg_away_score,
    AVG(home_team_win) AS avg_home_win_rate
FROM nba.games
GROUP BY season
ORDER BY season ASC;

------------------------------------------------
-- Scoring, home win rate, and three-point
-- percentages by season
------------------------------------------------

SELECT
    season,
    AVG(pts_home) AS avg_home_score,
    AVG(pts_away) AS avg_away_score,
    AVG(home_team_win) AS avg_home_win_rate,
    AVG(pct_3p_home) AS avg_home_3pt_percentage,
    AVG(pct_3p_away) AS avg_away_3pt_percentage
FROM nba.games
GROUP BY season
ORDER BY season ASC;

------------------------------------------------
-- Home win rate and three-point percentage
-- for each team and season
------------------------------------------------

SELECT
    team_home,
    season,
    AVG(home_team_win) AS avg_home_win_rate,
    AVG(pct_3p_home) AS avg_home_3pt_percentage
FROM nba.games
GROUP BY
    team_home,
    season
ORDER BY
    team_home,
    season;

------------------------------------------------
-- Team performance from the 2018 season onward
------------------------------------------------

SELECT
    team_home,
    season,
    AVG(home_team_win) AS avg_home_win_rate,
    AVG(pct_3p_home) AS avg_home_3pt_percentage
FROM nba.games
WHERE season >= '2018'
GROUP BY
    team_home,
    season
ORDER BY
    team_home,
    season;

------------------------------------------------
-- Teams shooting at least 37% from three
-- from the 2018 season onward
------------------------------------------------

SELECT
    team_home,
    season,
    AVG(home_team_win) AS avg_home_win_rate,
    AVG(pct_3p_home) AS avg_home_3pt_percentage
FROM nba.games
WHERE season >= '2018'
GROUP BY
    team_home,
    season
HAVING AVG(pct_3p_home) >= 0.37
ORDER BY
    avg_home_3pt_percentage DESC;

------------------------------------------------
-- Losing teams that still shot at least 37%
-- from three
------------------------------------------------

SELECT
    team_home,
    season,
    AVG(home_team_win) AS avg_home_win_rate,
    AVG(pct_3p_home) AS avg_home_3pt_percentage
FROM nba.games
WHERE season >= '2018'
GROUP BY
    team_home,
    season
HAVING
    AVG(pct_3p_home) >= 0.37
    AND AVG(home_team_win) < 0.50
ORDER BY
    avg_home_3pt_percentage DESC;

------------------------------------------------
-- Teams shooting 34% or lower from three
-- from the 2018 season onward
------------------------------------------------

SELECT
    team_home,
    season,
    AVG(home_team_win) AS avg_home_win_rate,
    AVG(pct_3p_home) AS avg_home_3pt_percentage
FROM nba.games
WHERE season >= '2018'
GROUP BY
    team_home,
    season
HAVING AVG(pct_3p_home) <= 0.34
ORDER BY
    avg_home_3pt_percentage ASC;

------------------------------------------------
-- Losing teams shooting 34% or lower from three
------------------------------------------------

SELECT
    team_home,
    season,
    AVG(home_team_win) AS avg_home_win_rate,
    AVG(pct_3p_home) AS avg_home_3pt_percentage
FROM nba.games
WHERE season >= '2018'
GROUP BY
    team_home,
    season
HAVING
    AVG(pct_3p_home) <= 0.34
    AND AVG(home_team_win) < 0.50
ORDER BY
    avg_home_3pt_percentage ASC;
