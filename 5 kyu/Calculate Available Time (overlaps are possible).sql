-- -----------------------------------------------------------
-- In the online tutoring platform, tutors set their availability by specifying 
-- a start and end time for each slot. These slots, spanning from 1970 to 2999, 
-- can overlap. Your task is to write a performant PostgreSQL query that 
-- calculates the total availability time for a specific tutor 
-- (e.g., user_id= 777) over their entire record. The query should 
-- efficiently handle a large dataset, merging overlapping intervals to compute 
-- the total distinct availability in minutes.
-- 
-- The availability table in your PostgreSQL database has the following schema:
-- 
-- id (integer) - The unique identifier for each availability entry.
-- user_id (integer) - The unique identifier for the user (tutor).
-- avail_start (timestamp) - The start time of the availability slot.
-- avail_end (timestamp) - The end time of the availability slot.
-- 
-- Write a PostgreSQL query that calculates the total availability time for 
-- the user with user_id= 777. The total availability time should be the sum 
-- of the durations of all distinct (non-overlapping) availability slots. The 
-- result should be given in minutes as a column total_minutes of integer type. 
-- The overlapping intervals should be merged. For example, if there is one 
-- interval from 16:00 to 17:00 and another from 16:30 to 17:30, the total 
-- availability should be considered as 90 minutes, not 120.
-- 
-- Let's provide a concrete example:
-- 
-- | id | user_id | avail_start         | avail_end           |
-- +----+---------+---------------------+---------------------+
-- | 1  | 777     | 2023-07-24 16:00:00 | 2023-07-24 17:00:00 |
-- | 2  | 777     | 2023-07-24 16:00:00 | 2023-07-24 16:50:00 |
-- | 3  | 777     | 2023-07-24 18:00:00 | 2023-07-24 18:30:00 |
-- | 4  | 777     | 2023-07-24 17:30:00 | 2023-07-24 18:10:00 |
-- | 5  | 777     | 2023-07-24 16:00:00 | 2023-07-24 17:10:00 |
-- | 6  | 777     | 2023-07-24 16:00:00 | 2023-07-24 16:50:00 |
-- 
-- The result should be:
-- 
-- | total_minutes |
-- +---------------+
-- | 130           |
-- 
-- Here is the breakdown:
-- 
-- '2023-07-24 16:00' to '2023-07-24 17:00' (id=1) contributes 60 minutes.
-- '2023-07-24 16:00' to '2023-07-24 16:50' (id=2) falls within id=1, so it 
-- contributes 0 minutes.
-- '2023-07-24 18:00' to '2023-07-24 18:30' (id=3) is a completely distinct 
-- interval, so it contributes 30 minutes.
-- '2023-07-24 17:30' to '2023-07-24 18:10' (id=4) overlaps 10 minutes with 
-- id=3 (18:00 to 18:10), so the unique time contribution of this interval is 
-- from 17:30 to 18:00, which is 30 minutes.
-- '2023-07-24 16:00' to '2023-07-24 17:10' (id=5) overlaps completely with 
-- id=1 but extends 10 minutes beyond it, so it contributes 10 minutes.
-- '2023-07-24 16:00' to '2023-07-24 16:50' (id=6) falls within id=1, so it 
-- contributes 0 minutes.
-- 
-- Adding these up: 60 + 0 + 30 + 30 + 10 + 0 equals 130 minutes.
-- 
-- GLHF!
-- 
-- Notes:
-- 
-- It is ensured that the start time is always before the end time
-- It is possible that slots start in one day and end in another
-- -----------------------------------------------------------

WITH user_slots AS (
    SELECT
        avail_start,
        avail_end
    FROM availability
    WHERE user_id = 777
),
ordered AS (
    SELECT
        avail_start,
        avail_end,
        MAX(avail_end) OVER (
            ORDER BY avail_start, avail_end
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS running_end
    FROM user_slots
),
marked AS (
    SELECT
        avail_start,
        avail_end,
        running_end,
        CASE
            WHEN avail_start > LAG(running_end) OVER (ORDER BY avail_start, avail_end)
            THEN 1
            ELSE 0
        END AS is_new_group
    FROM ordered
),
grouped AS (
    SELECT
        avail_start,
        avail_end,
        SUM(COALESCE(is_new_group, 0)) OVER (ORDER BY avail_start, avail_end) AS grp
    FROM marked
),
merged AS (
    SELECT
        MIN(avail_start) AS merged_start,
        MAX(avail_end) AS merged_end
    FROM grouped
    GROUP BY grp
)
SELECT COALESCE(SUM(EXTRACT(EPOCH FROM (merged_end - merged_start)) / 60)::INTEGER, 0)
AS total_minutes
FROM merged;

-- -----------------------------------------------------------
-- License
-- Tasks are the property of Codewars (https://www.codewars.com/) 
-- and users of this resource.
-- 
-- All solution code in this repository 
-- is the personal property of Vladimir Rukavishnikov
-- (vladimirrukavishnikovmail@gmail.com).
-- 
-- Copyright (C) 2025 Vladimir Rukavishnikov
-- 
-- This file is part of the HungryVovka/Codewars-SQL
-- (https://github.com/HungryVovka/Codewars-SQL)
-- 
-- License is GNU General Public License v3.0
-- (https://github.com/HungryVovka/Codewars-SQL/blob/main/LICENSE)
-- 
-- You should have received a copy of the GNU General Public License v3.0
-- along with this code. If not, see http://www.gnu.org/licenses/
-- -----------------------------------------------------------