with customers as (
    select * from {{ ref('stg_ecomm__customers') }}
),

order_totals as (
    select * from {{ ref('_order_totals') }}
)

select
    customers.customer_id,
    customers.email,
    order_totals.order_count,
    order_totals.total_revenue
from customers
left join order_totals on customers.customer_id = order_totals.customer_id
