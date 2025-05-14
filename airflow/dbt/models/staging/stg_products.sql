with product_src as (
    select * from {{ref('raw_products')}}
),

stg_product as (
select
    product_scheme_code::VARCHAR as product_scheme_code,
    product_scheme_type:: VARCHAR as product_scheme_type,
    product_scheme_category:: VARCHAR as product_scheme_category,
    product_scheme_sub_category:: VARCHAR as product_scheme_sub_category
from product_src
)

select * from stg_product