-- Выручка по месяцам
SELECT 
    DATE_TRUNC('month', InvoiceDate) AS month,
    SUM(Quantity * UnitPrice) AS revenue
FROM retail_clean
WHERE Quantity > 0 
  AND UnitPrice > 0
GROUP BY month
ORDER BY month;

-- Количество заказов по месяцам
SELECT 
    DATE_TRUNC('month', InvoiceDate) AS month,
    COUNT(DISTINCT InvoiceNo) AS orders
FROM retail_clean
WHERE Quantity > 0 
  AND UnitPrice > 0
GROUP BY month
ORDER BY month;

-- Средний чек по месяцам
SELECT 
    DATE_TRUNC('month', InvoiceDate) AS month,
    SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo) AS avg_order
FROM retail_clean
WHERE Quantity > 0 
  AND UnitPrice > 0
GROUP BY month
ORDER BY month;