with tran_type as ( select
case 
	when digital_flag = 'N' THEN 'Digital_transaction'
	when digital_flag = 'Y' THEN 'Non_Digital_transaction'
	else 'Unkown'
	end as transaction_type,
	count(*) as transaction_count
	
	from {{ref('stg_transactions')}}
	group by digital_flag
	)

select 
    transaction_type,
    transaction_count,
    Round((transaction_count::NUMERIC)*100/(select count(*) from transactions),2) as percentage 
from tran_type 
