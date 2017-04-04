SELECT DISTINCT 
s.date, s.ticker, s.price*s.num_of_shares as "AAPL total sell price",
b.date, sum(b.price*b.num_of_shares) as "daily sum NASDAQ total buy price"
FROM buynsell as b, buynsell as s
WHERE b.buy_or_sell = "BUY"
and NOT (b.ticker = "AAPL")
and b.ticker IN (
    SELECT DISTINCT ticker
    FROM stock
    WHERE exchange = "NASDAQ"
)
and s.buy_or_sell = "SELL"
and s.ticker="AAPL"
and b.date = s.date
GROUP BY b.date, s.date, s.price, s.num_of_shares
HAVING sum(b.price*b.num_of_shares) < s.price*s.num_of_shares