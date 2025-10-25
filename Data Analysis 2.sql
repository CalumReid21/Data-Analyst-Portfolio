-- Exploratory analysis looking at the number of workouts I complete, by week and year. This helps me identify patterns such as time of year where my motivation drops.

WITH weekly_sessions AS (
    SELECT Year, Week_Number,
        COUNT(DISTINCT Workout_Date) AS Sessions
    FROM Gym
    GROUP BY year, Week_Number),

comparison AS(
    SELECT *,
        (SELECT AVG(sessions) FROM weekly_sessions) AS avg_sessions
    FROM weekly_sessions)

SELECT year, Week_Number, Sessions, ROUND(avg_sessions, 1) AS Avg_sessions,
    CASE 
        WHEN sessions > avg_sessions THEN 'Above Average'
        WHEN sessions = avg_sessions THEN 'Average'
        ELSE 'Below Average'
    END AS Performance
FROM comparison
ORDER BY year, Week_Number