 --"DATA OVERVIEW ON DEPOSIT"
SELECT * FROM deposits
 
 --"What is the median/average deposit value of those using payment method 3 in 2020?"
 SELECT avg(amount) 
 FROM deposits 
 where payment_method_id =3 and inserted_at between "2020-01-01T00:00:00.000Z" AND "2020-12-31T00:00:00.000Z"
 
 --"When, in terms of which month of which year, did we observe the peak and valley (max and min) of deposit volume for Bamboo since inception?"
 SELECT MAX(amount) AS MAXIMUM_MINIMUM_PAYMENT, inserted_at
 FROM deposits
 UNION
 SELECT MIN(amount) AS MAXIMUM_MINIMUM_PAYMENT, inserted_at
 FROM deposits
 ORDER BY MAXIMUM_MINIMUM_PAYMENT DESC
 
 --Who are our power (most frequent) depositors by volume in 2021? Retrieve the user_id and the total volume of those users
 SELECT user_id, SUM(amount) AS TOTAL_VOLUME
 FROM deposits
 GROUP BY user_id
 ORDER BY amount DESC
 
 --We define High Net Worth individuals as people depositing $10k or above. Retrieve the user_id and the total deposits for users in that segment
 SELECT user_id, SUM(amount) AS TOTAL_AMOUNT
 FROM deposits
 WHERE amount >= 10000
 GROUP BY user_id
 ORDER BY amount DESC
 
 --What's the most used payment method among all users by volume?
 SELECT  DISTINCT payment_method_id, COUNT(amount) AS NUMBER_OF_TRANSACTION
 FROM deposits
 GROUP BY payment_method_id
 ORDER BY NUMBER_OF_TRANSACTION DESC

 --What's the average transaction fee?
 SELECT AVG(fee) AS AVERAGE_TRANSACTION_FEE 
 FROM deposits
 
 