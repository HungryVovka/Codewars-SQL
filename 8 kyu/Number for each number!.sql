-- -----------------------------------------------------------
-- Enumerate me
-- We have a list of numbers. But each number should have its own number to identify it.
-- 
-- Sounds crazy? Maybe, but that's what you should do: assign each row a number from 1 to infinity and name it id.
-- 
-- For example:
-- 
-- |----|-----|
-- | 1  | 32 |
-- | 2  | 44  |
-- | 3  | 56 |
-- |----|-----|
-- 
-- You should not use create or alter, only select.
-- 
-- So the output schema is:
-- 
-- |--------------|
-- | numbers      |
-- |----|---------|
-- | id | integer |
-- | n  | integer |
-- |----|---------|
-- -----------------------------------------------------------

-- select all of the numbers

SELECT ROW_NUMBER() OVER(ORDER BY n) AS id, * FROM numbers;