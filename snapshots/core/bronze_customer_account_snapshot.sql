{% snapshot bronze_customer_account %}

    {{
        config(
          target_database='bronze',
          target_schema='core',
          strategy='timestamp',
          unique_key='id',
          updated_at= 'last_modified_timestamp',
          alias='customer_account'
        )
    }}

    select *, {{ dbt_utils.surrogate_key(['id', 'last_modified_timestamp']) }} as bronze_id from {{ source ('staging', 'staging_customer_account')}}

{% endsnapshot %}


