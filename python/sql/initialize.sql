CREATE TABLE IF NOT EXISTS stock (
        ticker VARCHAR(10) PRIMARY KEY,
        exchange VARCHAR(15)
        );
INSERT INTO stock
  (ticker, exchange)
VALUES
  ("AAPL", "NASDAQ"), ("GOOG", "NASDAQ"), ("MSFT", "NASDAQ"),  ("IBM", "NYSE");

CREATE TABLE IF NOT EXISTS price (
    ticker VARCHAR(10),
    date DATE,
    close DECIMAL(13,2),
    PRIMARY KEY (ticker, date, close),
    FOREIGN KEY (ticker) REFERENCES stock(ticker)
);
INSERT INTO price
        (ticker, date, close)
VALUES
("AAPL", "2017-03-20", 100.00), ("AAPL", "2017-03-21", 101.50),
("AAPL", "2017-03-22", 106.50), ("GOOG", "2017-03-20", 100.00),
("GOOG", "2017-03-21", 130.00), ("GOOG", "2017-03-22", 110.00),
("MSFT", "2017-03-20", 184.50), ("MSFT", "2017-03-21", 188.50),
("MSFT", "2017-03-22", 210.00), ("IBM", "2017-03-20",   72.00),
("IBM", "2017-03-21",   70.00), ("IBM", "2017-03-22",   10.00);
        
CREATE TABLE IF NOT EXISTS buynsell (
        buy_or_sell varchar(4),
        ticker VARCHAR(10),
        date DATE,
        timestamp TIME,
        price DECIMAL(13,2),
        num_of_shares INT UNSIGNED,
        FOREIGN KEY (ticker) REFERENCES stock(ticker)

 );
INSERT INTO buynsell
        (ticker, buy_or_sell, date, timestamp, price, num_of_shares)
VALUES
("IBM", "BUY", "2017-03-20", "11:55:00", 273.00, 1100), ("IBM","BUY","2017-03-21", "10:45:00", 271.00, 2400),
("IBM", "SELL", "2017-03-22", "12:09:00", 270.50, 2500), ("GOOG","BUY", "2017-03-20", "12:22:00", 86.00, 2200),
("GOOG", "SELL", "2017-03-20", "14:00:00", 87.00, 1000),("GOOG", "SELL", "2017-03-21", "10:22:00", 87.50, 1000),
("GOOG", "BUY", "2017-03-21", "13:28:00", 87.00, 800), ("GOOG", "SELL", "2017-03-22", "11:45:00", 86.00, 500),
("AAPL", "BUY", "2017-03-20", "10:01:00", 99.00, 1000), ("AAPL", "BUY", "2017-03-20", "11:22:00", 99.50, 1000),
("AAPL", "SELL", "2017-03-22", "14:42:00", 103.00, 3000), ("AAPL", "BUY", "2017-03-21", "14:22:00", 100.00, 1000),
("MSFT", "BUY", "2017-03-20", "11:45:00", 186.00, 1500), ("MSFT", "SELL", "2017-03-21", "10:45:00", 188.00, 1000),
("MSFT", "BUY", "2017-03-22", "12:03:00", 187.00, 5000);

