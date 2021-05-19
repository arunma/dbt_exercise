{{
    config(
        target_database='gold',
        target_schema='core',
        materialized = 'table',
        alias='product_status_count'
    )
}}

select type as account_type, 
current_status as status, 
count(id) as num_accounts
from {{ ref ('silver_customer_account') }} as cust
where dbt_valid_to is null
group by current_status, type