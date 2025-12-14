-- -----------------------------------------------------------
-- Trilingual democracy
-- Switzerland has four official languages: German, French, Italian, and Romansh.¹
-- 
-- When native speakers of one or more of these languages meet, they follow 
-- certain regulations to choose a language for the group.² Here are the rules for 
-- groups of exactly three³ people:⁴
-- 
-- When all three are native speakers of the same language, it also becomes 
-- their group's language.⁵ᵃ
-- 
-- When two are native speakers of the same language, but the third person speaks 
-- a different language, all three will converse in the minority language.⁵ᵇ
-- 
-- When native speakers of three different languages meet, they eschew these three 
-- languages and instead use the remaining of the four official languages.⁵ᶜ
-- 
-- The languages are encoded by the letters D for Deutsch, F for Français, 
-- I for Italiano, and K for Rumantsch.⁶
-- 
-- Your task is to write a function that takes a list of three languages and 
-- returns the language the group should use.⁷ ⁸
-- 
-- Examples:⁹
-- 
-- The language for a group of three native French speakers is French: FFF → F
-- 
-- A group of two native Italian speakers and a Romansh speaker converses 
-- in Romansh: IIK → K
-- 
-- When three people meet whose native languages are German, French, and Romansh, 
-- the group language is Italian: DFK → I
-- 
-- ¹ The first sentence of the description and the first sentence of this footnote 
-- are true. Almost all other sentences in the description and the footnotes are 
-- complete hogwash.
-- 
-- ² This footnote has no useful content. It was inserted solely to make the next 
-- footnote – at least in some sense – self-referential.
-- 
-- ³ Thou shalt count to three, no more, no less. Four shalt thou not count, neither 
-- count thou two, excepting that thou then proceed to three. Five is right out.
-- 
-- ⁴ These rules were carefully designed with a focus on practices that could be 
-- perceived as exclusive or discriminatory.
-- 
-- ⁵ᵃ The first rule is based on pragmatics and aesthetics: choosing a language 
-- other than the one spoken by all three would introduce gratuitous friction and 
-- asymmetry.
-- 
-- ⁵ᵇ The second rule is inspired by a strong sense of politeness and modesty: 
-- it would feel arrogant for the majority to impose its language upon the minority.
-- 
-- ⁵ᶜ The third rule originates from a deep belief in fairness: picking one of 
-- the languages spoken in the group would arbitrarily privilege one member and 
-- disadvantage the two others.
-- 
-- ⁶ The choice of the letter K for Rumantsch was an accident – during the 
-- linguistic rule standardization process in 1964 a typist at the Bundesamt für 
-- Organisation misread a hand-written R as K. Unfortunately, correcting this 
-- mistake would break backwards compatibility.
-- 
-- ⁷ The input argument of your function will always be a string (or an array, 
-- depending on programming language) of exactly three upper-case characters 
-- from the set D, F, I and K, and the return value of your function must be 
-- a single upper-case character from this set.
-- 
-- ⁸ This footnote is a deceptive non sequitur, as it erroneously claims that 
-- the multilingual people of Switzerland are united by a shared fondness for 
-- watchmaking, bit twiddling, the Basic Latin Unicode block, and Gruyère cheese.
-- 
-- ⁹ This is footnote 9, and it's just as nonsensical as footnotes 2, 3, and 8, 
-- since it merely observes that 9 happens to be the bitwise exclusive-or 
-- of 2, 3, and 8.
-- -----------------------------------------------------------

--# write your SQL statement here: 
-- you are given a table 'trilingual_democracy' with column 'grp' (String)
--   'grp' contains chars from the set 'D', 'F', 'I', 'K'
-- create a query with:
--   'grp' and your result in a column named 'res' (char)
--   'res' is a single char from the above set
--   ordered ascending by 'grp'
SELECT
    democracy.grp,
    CASE
        WHEN max_symbol_count = 3 THEN
            CASE
                WHEN count_d = 3 THEN 'D'
                WHEN count_f = 3 THEN 'F'
                WHEN count_i = 3 THEN 'I'
                ELSE 'K'
            END
        WHEN max_symbol_count = 2 THEN
            CASE
                WHEN count_d = 1 THEN 'D'
                WHEN count_f = 1 THEN 'F'
                WHEN count_i = 1 THEN 'I'
                ELSE 'K'
            END
        ELSE
            CASE
                WHEN count_d = 0 THEN 'D'
                WHEN count_f = 0 THEN 'F'
                WHEN count_i = 0 THEN 'I'
                ELSE 'K'
            END
    END AS res
FROM (
    SELECT
        grp,
        LENGTH(grp) - LENGTH(REPLACE(grp, 'D', '')) AS count_d,
        LENGTH(grp) - LENGTH(REPLACE(grp, 'F', '')) AS count_f,
        LENGTH(grp) - LENGTH(REPLACE(grp, 'I', '')) AS count_i,
        LENGTH(grp) - LENGTH(REPLACE(grp, 'K', '')) AS count_k,
        GREATEST (
            LENGTH(grp) - LENGTH(REPLACE(grp, 'D', '')),
            LENGTH(grp) - LENGTH(REPLACE(grp, 'F', '')),
            LENGTH(grp) - LENGTH(REPLACE(grp, 'I', '')),
            LENGTH(grp) - LENGTH(REPLACE(grp, 'K', ''))
        ) AS max_symbol_count
    FROM trilingual_democracy
) AS democracy
ORDER BY democracy.grp ASC;  

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