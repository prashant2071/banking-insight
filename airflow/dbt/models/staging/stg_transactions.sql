with source as (
    select * from {{ref('raw_transactions')}}
),stg_tran as
 (
        select
        transaction_id :: VARCHAR as transaction_id,
        transaction_key::VARCHAR as transaction_key,
        foracid::VARCHAR as foracid,
        transaction_amount::NUMERIC as transaction_amount,
        amount_left::NUMERIC as amount_left,
        COALESCE(p_tran_type::VARCHAR,'C') as p_tran_type,
        COALESCE(digital_flag::VARCHAR,'N') as digital_flag,
        transaction_channel_type::VARCHAR as transaction_channel_type,
        COALESCE(timestamp::timestamp,CURRENT_TIMESTAMP) as timestamp


    from source
)

select * from stg_tran