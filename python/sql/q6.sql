SELECT DISTINCT sell.buy_or_sell,sell.ticker,sell.date, 
sell.price*sell.num_of_shares as sell_total_price, 
buy.buy_or_sell,buy.ticker, buy.price*buy.num_of_shares as buy_total_price
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
