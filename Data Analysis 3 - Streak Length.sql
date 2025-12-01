-- Collapse rows with GROUP BY
WITH sessions AS
	(SELECT user, Workout_Date FROM Gym
     GROUP BY user, Workout_Date),


-- Identifying breaks in streaks
breaks AS
	(SELECT user, Workout_Date,
     CASE WHEN Workout_Date = date(LAG(Workout_Date) OVER(PARTITION BY user 	 ORDER BY Workout_Date ASC), '+1 day') THEN 0 ELSE 1 END AS break_flag
     FROM sessions),


-- Creating streak groups
grouped AS
	(SELECT user, Workout_Date,
     SUM(break_flag) OVER(PARTITION BY user ORDER BY Workout_Date ASC) AS streak_group
     FROM breaks),


-- Creating aggregations for streak length, start date and end date
counter AS
	(SELECT user, streak_group, COUNT(*) AS Streak_Length, MIN(Workout_Date) 	 AS Start_Date, MAX(Workout_Date) AS End_Date FROM grouped
     GROUP BY user, streak_group),


-- Final CTE using DENSE_RANK to capture longest streak
ranked AS
	(SELECT *,
     DENSE_RANK() OVER(PARTITION BY user ORDER BY streak_length DESC) AS ranking 
     FROM counter)

-- Filtering on rank 1 for outer query, to return longest streak only
SELECT user, Streak_Length, Start_Date, End_Date
FROM ranked
WHERE ranking = 1;