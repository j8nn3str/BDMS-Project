SELECT DISTINCT d1.ticker, d2.close as "03/22 Close", d1.close as "03/21 Close", max(d2.close - d1.close) as "max difference"
FROM price as d1, price as d2
WHERE 
    d1.date = "2017-03-20" and d2.date = "2017-03-21"
and d1.ticker = d2.ticker    
and d1.ticker IN (
        SELECT DISTINCT ticker
        FROM price
        WHERE close > 100
        and date >= "2017-01-01" and date < "2018-01-01"
        and ticker IN (
            SELECT DISTINCT ticker
            FROM stock
            WHERE exchange = "NYSE"
        )
)
and d2.ticker IN (
        SELECT DISTINCT ticker
        FROM price
        WHERE close > 100
        and date >= "2017-01-01" and date < "2018-01-01"    
        and ticker IN (
            SELECT DISTINCT ticker
            FROM stock
            WHERE exchange = "NYSE"
        )        
)