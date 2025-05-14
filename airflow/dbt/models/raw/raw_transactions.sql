with source as (
    select * from {{ source('raw', 'transactions') }}
),raw_tran as
 (
        select
        transaction_id,
        transaction_key,
        foracid,
        transaction_amount,
        amount_left,
        p_tran_type,
        digital_flag,
        transaction_channel_type,
        timestamp


    from source
)

select * from raw_tran