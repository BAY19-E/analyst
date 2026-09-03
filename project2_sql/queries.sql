SELECT FirstName, LastName, Country, City, Email
FROM customers
LIMIT 10;


SELECT Country, COUNT(*) AS Количество_клиентов
FROM customers
GROUP BY Country
ORDER BY COUNT(*) DESC;


SELECT InvoiceId, CustomerId, Total, InvoiceDate
FROM invoices
ORDER BY Total DESC
LIMIT 5;


SELECT 
    c.FirstName || ' ' || c.LastName AS Клиент,
    t.Name AS Трек,
    i.InvoiceDate AS Дата_покупки,
    i.Total AS Сумма_счета
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
JOIN tracks t ON ii.TrackId = t.TrackId
WHERE c.Country = 'Germany'
LIMIT 20;


SELECT 
    c.FirstName || ' ' || c.LastName AS Клиент,
    SUM(i.Total) AS Общая_сумма,
    RANK() OVER (ORDER BY SUM(i.Total) DESC) AS Рейтинг
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY Общая_сумма DESC
LIMIT 10;