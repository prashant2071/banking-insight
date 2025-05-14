with customer_src as (
    select * from {{source('raw','customers')}}
),
raw_cust as (
select
    cif_id,
    cust_first_name,
    cust_middle_name,
    cust_last_name,
    full_name,
    cust_type,
    cust_dob,
    gender,
    address_line,
    employment_status,
    salary_per_month,
    riskrating,
    marital_status,
    occupation,
    blacklisted,
    pan,
    email,
    cust_community,
    rating,
    constitution_code,
    constitution_code_desc,
    mobile_number,
    account_relationship_date


from customer_src
)
select * from raw_cust