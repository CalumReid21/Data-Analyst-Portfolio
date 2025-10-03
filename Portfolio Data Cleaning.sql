BEGIN TRANSACTION;

-- Rename the raw table first
ALTER TABLE _gym_20251003 RENAME TO Gym_Raw;

-- Create the cleaned table
CREATE TABLE Gym AS
SELECT
    DATE("Workout Start") AS Workout_Date,

    Exercise,
    Weight,
    Reps,
    Notes,
    Category,
    Name,

    -- New calculated columns
    (Weight * Reps) AS Volume,
    strftime('%Y', "Workout Start") AS Year,
    CASE strftime('%m', "Workout Start")
         WHEN '01' THEN 'January'
         WHEN '02' THEN 'February'
         WHEN '03' THEN 'March'
         WHEN '04' THEN 'April'
         WHEN '05' THEN 'May'
         WHEN '06' THEN 'June'
         WHEN '07' THEN 'July'
         WHEN '08' THEN 'August'
         WHEN '09' THEN 'September'
         WHEN '10' THEN 'October'
         WHEN '11' THEN 'November'
         WHEN '12' THEN 'December'
    END AS Month_Name,
    strftime('%W', "Workout Start") + 1 AS Week_Number,
    CASE strftime('%w', "Workout Start")
         WHEN '0' THEN 'Sunday'
         WHEN '1' THEN 'Monday'
         WHEN '2' THEN 'Tuesday'
         WHEN '3' THEN 'Wednesday'
         WHEN '4' THEN 'Thursday'
         WHEN '5' THEN 'Friday'
         WHEN '6' THEN 'Saturday'
    END AS Day_Name
FROM Gym_Raw;

	-- Drop raw data table
DROP TABLE Gym_Raw;

COMMIT;