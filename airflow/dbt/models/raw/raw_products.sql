with product_src as (
    select * from {{source('raw','products')}}
),

raw_product as (
select
    product_scheme_code,
    product_scheme_type,
    product_scheme_category,
    product_scheme_sub_category
from product_src
)

select * from raw_product