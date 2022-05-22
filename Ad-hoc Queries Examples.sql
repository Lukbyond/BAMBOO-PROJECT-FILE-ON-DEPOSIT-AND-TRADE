--DATA OVERVIEW ON TRADE
SELECT * FROM trades 
SELECT * FROM deposits

-- Count all users who deposited since bamboo began but haven't traded
SELECT
(SELECT count (distinct (user_id)) FROM deposits)

- (SELECT count (DISTINCT(deposits.user_id))
FROM deposits
JOIN trades ON deposits.user_id=trades.user_id) AS DIFFERENCE

-- Count all users with deposits under $1k
SELECT COUNT(DISTINCT(user_id))
FROM deposits
WHERE amount <1000

-- Count all users who had 4 or more trades before 2021 but have not traded in 2021
--#PLEASE NOTE: NO USER HAD MORE THAN 4 TRADES BEFORE 2021. THIS IS THE LIST OF USERS WHO TRADED BEFORE 2021.
SELECT user_id, date(inserted_at) as date
FROM trades 
where date < "2020-12-31"
GROUP by inserted_at

-- Count all users who had 2 or more deposits before 2021 but have not deposited in 2021

SELECT user_id, id
FROM deposits 
where date(inserted_at) < "2020-12-31"
group by id


