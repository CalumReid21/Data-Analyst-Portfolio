-- Exploratory analysis to discover my 1,3 and 5 rep personal bests for my favourite exercises.

WITH BEST_REP_CHECK AS
	(SELECT Exercise, Workout_Date, Weight, Reps,
     	RANK() OVER(PARTITION BY exercise, Reps ORDER BY weight DESC) AS rank
     FROM Gym
     	WHERE Exercise IN ('Bench Press', 'Squat', 'Dumbbell Shoulder Press')
     			AND reps IN (1,3,5))

SELECT Exercise, Reps, Workout_Date, Weight AS Personal_Best
FROM BEST_REP_CHECK
WHERE rank = 1
GROUP BY Exercise, Reps
ORDER BY Exercise, Reps



