with tran_over_time as (
    SELECT 
    DATE_TRUNC('mon',timestamp) AS timestamp,
    sum(transaction_amount) AS amount
FROM {{ref('stg_transactions')}}
GROUP BY DATE_TRUNC('mon', timestamp)
ORDER BY amount 
)

SELECT timestamp, amount FROM tran_over_time
