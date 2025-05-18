with acc_open as (
SELECT Extract(YEAR FROM account_relationship_date) as Year,
count(*) total_account 
FROM {{ref('stg_customers')}}  
group by year 
order by year 
)
SELECT Year,total_account from acc_open  