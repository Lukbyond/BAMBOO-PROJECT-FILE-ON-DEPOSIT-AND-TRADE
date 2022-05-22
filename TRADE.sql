--DATA OVERVIEW ON TRADE
SELECT * FROM trades 

--Obtain the month-over-month change in absolute value and percentage for all completed (where status=Filled)Trades in 2020?
SELECT transaction_value,inserted_at,status, 
FROM trades 
where status="Filled" and inserted_at between "2020-01-01T00:00:00.000Z" AND "2020-12-31T00:00:00.000Z"

--Retrieve the list of user_id for those traded above 300x in 2020?
SELECT user_id
FROM trades
where inserted_at between "2020-01-01T00:00:00.000Z" AND "2020-12-31T00:00:00.000Z"
and transaction_value >300

--Find the best performing week, by total transaction value, from 2019 until today?
SELECT DATE(inserted_at)as date, sum(transaction_value) as total_value
FROM trades
group by date
order by total_value desc

--What are the top 5 bought stocks by volume? 
SELECT count(id) as frequent, stock_symbol
FROM trades
group by  stock_symbol
order by  frequent desc
limit 5

--What are the trade commissions for each side? 
SELECT side, sum(dollar_fee) AS TRADE_COMMISSIONS
FROM trades
where side="BUY"
UNION
SELECT side, sum(dollar_fee)
FROM trades
where side="SELL"

--Which stock generated the most commissions from the BUY side?
SELECT stock_symbol, sum(dollar_fee) AS TRADE_COMMISSIONS
FROM trades
where side="BUY"
GROUP BY stock_symbol
ORDER BY TRADE_COMMISSIONS DESC
LIMIT 1