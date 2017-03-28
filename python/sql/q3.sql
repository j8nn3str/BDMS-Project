SELECT DISTINCT ticker, date, close
FROM price
WHERE close IN (
    SELECT close
    FROM price
    WHERE date="2017-03-20" and close NOT IN (
        SELECT a.close
        FROM price as a, price as b
        WHERE a.close<b.close and a.date="2017-03-20" and b.date=a.date
        )
)