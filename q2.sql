SELECT DISTINCT 
a.ticker, a.date, a.close,
b.ticker, b.date, b.close,
c.ticker, c.date, c.close
FROM  price as a, price as b, price as c
WHERE a.date="2017-03-20" and a.date=b.date and a.date=c.date 
    and a.close>b.close and a.close <= c.close
    and b.ticker  IN (
        SELECT ticker
        FROM price
        WHERE ticker="IBM"
    )
    and c.ticker  IN (
        SELECT ticker
        FROM price
        WHERE ticker="GOOG"
    )