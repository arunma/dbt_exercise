{{
    config(
        target_database='gold',
        target_schema='core',
        materialized = 'table',
        alias='product_variant_count'
    )
}}


select type as account_type, 
product_variant_id as variant, 
count(id) as num_accounts
from {{ ref ('silver_customer_account') }} as cust
where cust.dbt_valid_to is null
group by product_variant_id, type