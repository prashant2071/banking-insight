with customer_src as (
    select * from {{ref('raw_customers')}}
),
stg_cust as (
select
    cif_id::VARCHAR as cif_id,
    cust_first_name::VARCHAR as cust_first_name,
    cust_middle_name::VARCHAR as cust_middle_name,
    cust_last_name::VARCHAR as cust_last_name,
    full_name::VARCHAR as full_name,
    cust_type::VARCHAR as cust_type,
    cust_dob::TIMESTAMP as cust_dob,
    gender::VARCHAR as gender,
    address_line::VARCHAR as address_line,
    employment_status::VARCHAR as employment_status,
    salary_per_month::NUMERIC as salary_per_month,
    riskrating::VARCHAR as riskrating,
    marital_status::VARCHAR as marital_status,
    occupation::VARCHAR as occupation,
    COALESCE(blacklisted::VARCHAR,'N') as blacklisted,
    pan::VARCHAR as pan,
    email::VARCHAR as email,
    cust_community::VARCHAR as cust_community,
    rating::VARCHAR as rating,
    constitution_code::VARCHAR as constitution_code,
    constitution_code_desc::VARCHAR as constitution_code_desc,
    mobile_number::VARCHAR as mobile_number,
    COALESCE(account_relationship_date::TIMESTAMP,CURRENT_TIMESTAMP) as account_relationship_date


from customer_src
)
select * from stg_cust