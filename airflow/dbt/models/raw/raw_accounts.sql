with account_src as (
    select * from {{source('raw','accounts')}}
),
raw_acc as
 (
SELECT
     acid,
    foracid,
     cif_id,
      acct_opn_date,
    account_status,
    lien_amt,
    product_schm_code,
    schm_type,
    sanct_lim,
    acct_crncy_code,
    del_flg,
    acct_cls_flg,
    drwng_power,
    interest_rate,
    accrued_interest,
    limit_b2kid,
    clr_bal_amt
FROM account_src
)
select * from raw_acc