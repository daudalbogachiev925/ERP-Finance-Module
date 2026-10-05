-- Актив / Пассив
SELECT
    CASE WHEN a.type IN ('A','AP') THEN 'Актив' ELSE 'Пассив' END AS section,
    SUM(p.amount) AS total
FROM postings p
JOIN accounts a ON a.code = p.debit_account
GROUP BY section;
