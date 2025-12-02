SQL Project — Gym Performance Analysis

This folder contains four SQL projects built from my own gym training data.
Each script demonstrates practical data cleaning and exploratory analysis skills — showing how I structure, transform, and analyse real-world data using SQL.

Due to access constraints, this portfolio has been written with SQLite dialect. However, I am primarily fluent in PostgreSQL and Snowflake SQL.

Recommended: Data Analysis 3 provides my best example of production grade SQL, producing a gap and island analysis to identify my longest streak of workout attendances.

NOTE: AI has not been uses to write any of the code displayed in this repository. All examples of my technical skills have been written freehand without syntax lookup or additional assitance.

⸻

1. Data Cleaning

Table: Gym

After exporting my workout data from an iOS app called 'RepCount', I bring it into SQL and perform data cleaning to make the table readeable, with additional fields.

⸻

2. Exploratory Analysis 1 — Personal Best Analysis

Goal:
Track progression of 1,3 and 5 rep max lifts over time for my favourite exercises.

Key Techniques:
	•	Common Table Expressions (CTEs)
	•	Window functions (RANK)
	•	Calculating changes between sessions
	•	Identifying peak performance and PR improvements

Output: Data Analysis 1 csv

⸻

3. Exploratory Analysis 2 — Workout Frequency

Goal:
Measure training consistency by counting sessions per week, comparing each week’s frequency to the lifetime average.

Key Techniques:
	•	Aggregations (COUNT DISTINCT, AVG)
	•	CTE layering for readability
	•	Conditional logic with CASE WHEN
	•	Grouping by both year and week_number

Output: Data Analysis 2 csv

⸻

4. Exploratory Analysis 3 — Longest Streak 

Goal:
Identify my longest consecutive streak of workouts, by date. In addition, identify the start and end dates of this streak.

Key Techniques:
	•	Window Functions
	•	Complex multi CTE logic
	•	Conditional logic with CASE WHEN
	•	Date handling

Output: Data Analysis 3 csv

⸻
Overview

Together, these projects demonstrate:
	•	Data cleaning and preparation
	•	Analytical reasoning and problem-solving
	•	Strong understanding of SQL structure (CTEs, window functions, grouping)
	•	A clear analytical workflow from raw data → cleaned dataset → insights
