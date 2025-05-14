with card_src as (
    select * from {{ref('raw_cards')}}
),

stg_card as (
select
    account_number::VARCHAR as account_number,
    card_number::VARCHAR as card_number,
    COALESCE(aty_code::NUMERIC, 1) as aty_code,
    card_status::VARCHAR as card_status,
    foracid::VARCHAR as foracid,
    CAST(car_code AS INT) as car_code,
    product_code::VARCHAR as product_code,
    credit_limit::NUMERIC as credit_limit,
    car_create_date::TIMESTAMP as car_create_date
from card_src
)

select * from stg_card