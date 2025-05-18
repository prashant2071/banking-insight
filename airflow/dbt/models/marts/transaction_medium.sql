select 
	transaction_channel_type,
	count(*) total_transaction 
from 
{{ref('stg_transactions')}} 

group by 
transaction_channel_type