SELECT DISTINCT ticker, date, close
FROM price
WHERE (close < 20 or close > 100)
and date="2017-03-20"
and ticker IN (
    SELECT ticker
    FROM stock
    WHERE exchange="NYSE"
)
