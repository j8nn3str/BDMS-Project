SELECT DISTINCT sell.date, sell.price*sell.num_of_shares as "AAPL total sell price", 
buy.ticker, buy.price*buy.num_of_shares as "total buy price"
FROM buynsell as sell, buynsell as buy
WHERE sell.ticker="AAPL" 
and sell.buy_or_sell="SELL" 
and buy.buy_or_sell="BUY"
and buy.ticker IN (
    SELECT DISTINCT ticker
    FROM stock
    WHERE exchange="NASDAQ"
)
and sell.price*sell.num_of_shares > buy.price*buy.num_of_shares
and buy.date = sell.date
