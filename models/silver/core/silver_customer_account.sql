{{
    config(
        materialized = 'incremental',
        unique_key = 'bronze_id',
        alias='customer_account'
    )
}}

select * from {{ ref ('bronze_customer_account')}}
{% if is_incremental() -%}
where last_modified_timestamp >= (select max(last_modified_timestamp) from {{ this }})
{% endif %}
