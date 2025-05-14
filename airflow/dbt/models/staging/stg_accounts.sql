with account_src as (
    select * from {{ref('raw_accounts')}}
),
stg_acc as
 (
SELECT
    CAST(acid AS VARCHAR) AS acid,
    CAST(foracid AS VARCHAR) AS foracid,
    CAST(cif_id AS VARCHAR) AS cif_id,
    COALESCE(CAST(acct_opn_date AS TIMESTAMP),CURRENT_TIMESTAMP) AS acct_opn_date,
    CAST(account_status AS VARCHAR) AS account_status,
    COALESCE(CAST(lien_amt AS NUMERIC),0) AS lien_amt,
    CAST(product_schm_code AS VARCHAR) AS product_schm_code,
    CAST(schm_type AS VARCHAR) AS schm_type,
    COALESCE(CAST(sanct_lim AS NUMERIC),0) AS sanct_lim,
    COALESCE(CAST(acct_crncy_code AS VARCHAR),'NPR') AS acct_crncy_code,
    COALESCE(CAST(del_flg AS VARCHAR),'N') AS del_flg,
    CAST(acct_cls_flg AS VARCHAR) AS acct_cls_flg,
    COALESCE(CAST(drwng_power AS NUMERIC),0) AS drwng_power,
    COALESCE(CAST(interest_rate AS NUMERIC),0) AS interest_rate,
    COALESCE(CAST(accrued_interest AS NUMERIC),0) AS accrued_interest,
    CAST(limit_b2kid AS VARCHAR) AS limit_b2kid,
    COALESCE(CAST(clr_bal_amt AS NUMERIC),0) AS clr_bal_amt
FROM account_src
)
select * from stg_acc