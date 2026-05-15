{{ config(materialized='ephemeral') }}

select
    customer_id,
    count(*)            as order_count,
    sum(total_amount)   as total_revenue
from {{ ref('stg_ecomm__orders') }}
group by 1
