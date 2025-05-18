SELECT 
    c.cif_id,
    COUNT(*) AS transaction_count,
    SUM(t.transaction_amount) AS total_transactions,
	avg(t.transaction_amount) AS avg_transactions,
	max(t.transaction_amount) AS max_transactions,
	min(t.transaction_amount) AS min_transactions
	
FROM {{ref('stg_accounts')}} AS a 
JOIN {{ref('stg_customers')}} AS c ON a.cif_id = c.cif_id
JOIN {{ref('stg_transactions')}} AS t ON t.foracid = a.foracid
GROUP BY c.cif_id
