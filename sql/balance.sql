-- Оборотно-сальдовая ведомость
WITH movements AS (
    SELECT debit_account AS acc, amount AS d, 0 AS k FROM postings
    UNION ALL
    SELECT credit_account AS acc, 0 AS d, amount AS k FROM postings
)
SELECT
    a.code, a.name,
    COALESCE(SUM(m.d),0) AS turnover_debit,
    COALESCE(SUM(m.k),0) AS turnover_credit,
    COALESCE(SUM(m.d),0) - COALESCE(SUM(m.k),0) AS balance
FROM accounts a
LEFT JOIN movements m ON a.code = m.acc
GROUP BY a.code, a.name
ORDER BY a.code;
