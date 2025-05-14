with card_src as (
    select * from {{source('raw','cards')}}
),

raw_card as (
select
    account_number,
    card_number,
    aty_code,
    card_status,
    foracid,
    car_code,
    product_code,
    credit_limit,
    car_create_date
from card_src
)

select * from raw_card