SELECT DISTINCT 
a.ticker, a.close as "03/20 close", b.close as "IBM 03/20 close", c.close as "GOOG 03/20 close"
FROM  price as a, price as b, price as c
WHERE a.date="2017-03-20" and a.date=b.date and a.date=c.date 
    and a.close>b.close and a.close <= c.close
    and b.ticker  IN (
        SELECT DISTINCT ticker
        FROM price
        WHERE ticker="IBM"
    )
    and c.ticker  IN (
        SELECT DISTINCT ticker
        FROM price
        WHERE ticker="GOOG"
    )