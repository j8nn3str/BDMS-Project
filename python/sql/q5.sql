SELECT DISTINCT ad2.ticker, ad2.close-ad1.close as difference
FROM price as ad1, price as ad2, price as bd1, price as bd2
WHERE ad1.date="2017-03-20" and ad2.date="2017-03-21"
and ad1.ticker=ad2.ticker and  ad1.ticker=bd1.ticker and ad1.ticker=bd2.ticker
and bd1.date=ad1.date and bd2.date=ad2.date
and ad2.close-ad1.close NOT IN (
    SELECT ad2.close-ad1.close
    FROM price as ad1, price as ad2, price as bd1, price as bd2
    WHERE ad1.date="2017-03-20" and ad2.date="2017-03-21"
    and ad1.ticker=ad2.ticker and  ad1.ticker=bd1.ticker 
    and ad1.ticker=bd2.ticker
        and ad2.close-ad1.close < bd2.close-bd1.close
)
