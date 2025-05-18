WITH account_with_cards AS (
select distinct account_number as foracid 
FROM 
{{ref('stg_cards')}}
),
customer_with_card as (
select  count(distinct c.cif_id) as have_card ,(select count(*) from customers) as total_customer
from customers as c 
join accounts as a on a.cif_id = c.cif_id 
where a.foracid in (select foracid from account_with_cards)
)

SELECT have_card,(total_customer -have_card) as dont_have_card , total_customer   from customer_with_card