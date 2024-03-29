-- -----------------------------------------------------------
-- Subtract the sum
-- NOTE! This kata can be more difficult than regular 8-kyu katas (lets say 7 or 6 kyu)
-- 
-- Complete the function which get an input number n such that n >= 10 and n < 10000, then:
-- 
-- Sum all the digits of n.
-- Subtract the sum from n, and it is your new n.
-- If the new n is in the list below return the associated fruit, otherwise return back to task 1.
-- 
-- Example
-- n = 325
-- sum = 3+2+5 = 10
-- n = 325-10 = 315 (not in the list)
-- sum = 3+1+5 = 9
-- n = 315-9 = 306 (not in the list)
-- sum = 3+0+6 = 9
-- n =306-9 = 297 (not in the list)
-- .
-- .
-- .
-- ...until you find the first n in the list below.
-- 
-- There is no preloaded code to help you. This is not about coding skills; think before you code
-- 
-- 1-kiwi
-- 2-pear
-- 3-kiwi
-- 4-banana
-- 5-melon
-- 6-banana
-- 7-melon
-- 8-pineapple
-- 9-apple
-- 10-pineapple
-- 11-cucumber
-- 12-pineapple
-- 13-cucumber
-- 14-orange
-- 15-grape
-- 16-orange
-- 17-grape
-- 18-apple
-- 19-grape
-- 20-cherry
-- 21-pear
-- 22-cherry
-- 23-pear
-- 24-kiwi
-- 25-banana
-- 26-kiwi
-- 27-apple
-- 28-melon
-- 29-banana
-- 30-melon
-- 31-pineapple
-- 32-melon
-- 33-pineapple
-- 34-cucumber
-- 35-orange
-- 36-apple
-- 37-orange
-- 38-grape
-- 39-orange
-- 40-grape
-- 41-cherry
-- 42-pear
-- 43-cherry
-- 44-pear
-- 45-apple
-- 46-pear
-- 47-kiwi
-- 48-banana
-- 49-kiwi
-- 50-banana
-- 51-melon
-- 52-pineapple
-- 53-melon
-- 54-apple
-- 55-cucumber
-- 56-pineapple
-- 57-cucumber
-- 58-orange
-- 59-cucumber
-- 60-orange
-- 61-grape
-- 62-cherry
-- 63-apple
-- 64-cherry
-- 65-pear
-- 66-cherry
-- 67-pear
-- 68-kiwi
-- 69-pear
-- 70-kiwi
-- 71-banana
-- 72-apple
-- 73-banana
-- 74-melon
-- 75-pineapple
-- 76-melon
-- 77-pineapple
-- 78-cucumber
-- 79-pineapple
-- 80-cucumber
-- 81-apple
-- 82-grape
-- 83-orange
-- 84-grape
-- 85-cherry
-- 86-grape
-- 87-cherry
-- 88-pear
-- 89-cherry
-- 90-apple
-- 91-kiwi
-- 92-banana
-- 93-kiwi
-- 94-banana
-- 95-melon
-- 96-banana
-- 97-melon
-- 98-pineapple
-- 99-apple
-- 100-pineapple
-- -----------------------------------------------------------

-- select n as res from sub_sum # 
-- sub_sum is a table with n being the integer passed in

CREATE TABLE fruits (id INT, fruit VARCHAR);
INSERT INTO fruits(id, fruit) VALUES
(1, 'kiwi'),
(2, 'pear'),
(3, 'kiwi'),
(4, 'banana'),
(5, 'melon'),
(6, 'banana'),
(7, 'melon'),
(8, 'pineapple'),
(9, 'apple'),
(10, 'pineapple'),
(11, 'cucumber'),
(12, 'pineapple'),
(13, 'cucumber'),
(14, 'orange'),
(15, 'grape'),
(16, 'orange'),
(17, 'grape'),
(18, 'apple'),
(19, 'grape'),
(20, 'cherry'),
(21, 'pear'),
(22, 'cherry'),
(23, 'pear'),
(24, 'kiwi'),
(25, 'banana'),
(26, 'kiwi'),
(27, 'apple'),
(28, 'melon'),
(29, 'banana'),
(30, 'melon'),
(31, 'pineapple'),
(32, 'melon'),
(33, 'pineapple'),
(34, 'cucumber'),
(35, 'orange'),
(36, 'apple'),
(37, 'orange'),
(38, 'grape'),
(39, 'orange'),
(40, 'grape'),
(41, 'cherry'),
(42, 'pear'),
(43, 'cherry'),
(44, 'pear'),
(45, 'apple'),
(46, 'pear'),
(47, 'kiwi'),
(48, 'banana'),
(49, 'kiwi'),
(50, 'banana'),
(51, 'melon'),
(52, 'pineapple'),
(53, 'melon'),
(54, 'apple'),
(55, 'cucumber'),
(56, 'pineapple'),
(57, 'cucumber'),
(58, 'orange'),
(59, 'cucumber'),
(60, 'orange'),
(61, 'grape'),
(62, 'cherry'),
(63, 'apple'),
(64, 'cherry'),
(65, 'pear'),
(66, 'cherry'),
(67, 'pear'),
(68, 'kiwi'),
(69, 'pear'),
(70, 'kiwi'),
(71, 'banana'),
(72, 'apple'),
(73, 'banana'),
(74, 'melon'),
(75, 'pineapple'),
(76, 'melon'),
(77, 'pineapple'),
(78, 'cucumber'),
(79, 'pineapple'),
(80, 'cucumber'),
(81, 'apple'),
(82, 'grape'),
(83, 'orange'),
(84, 'grape'),
(85, 'cherry'),
(86, 'grape'),
(87, 'cherry'),
(88, 'pear'),
(89, 'cherry'),
(90, 'apple'),
(91, 'kiwi'),
(92, 'banana'),
(93, 'kiwi'),
(94, 'banana'),
(95, 'melon'),
(96, 'banana'),
(97, 'melon'),
(98, 'pineapple'),
(99, 'apple'),
(100, 'pineapple');

CREATE FUNCTION SUMDIGITS(x INT) RETURNS INT 
LANGUAGE PLPGSQL AS $$
DECLARE y INT := 0;
BEGIN
    WHILE (x > 0) LOOP
        y := y + x % 10;
        x := x / 10;
    END LOOP;
RETURN y;
END $$;

CREATE FUNCTION NRANGE(x INT, y INT) RETURNS INT 
LANGUAGE PLPGSQL AS $$
BEGIN
    x := x - SUMDIGITS(x);
    WHILE (x > 9 AND x > y) LOOP
        x := SUMDIGITS(x);
    END LOOP;
RETURN x;
END $$;

SELECT fruits.fruit AS res FROM (SELECT NRANGE(n, 100) AS n FROM sub_sum)
i INNER JOIN fruits ON i.n = fruits.id;

-- or

SELECT 'apple' AS res FROM sub_sum;

-- -----------------------------------------------------------
-- License
-- Tasks are the property of Codewars (https://www.codewars.com/) 
-- and users of this resource.
-- 
-- All solution code in this repository 
-- is the personal property of Vladimir Rukavishnikov
-- (vladimirrukavishnikovmail@gmail.com).
-- 
-- Copyright (C) 2022 Vladimir Rukavishnikov
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