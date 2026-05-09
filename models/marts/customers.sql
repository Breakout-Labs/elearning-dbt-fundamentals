{% set country = var('country') %}
{% set dev_limit = var('dev_limit') %}

with orders as (
    select
        id as order_id,
        customer_id,
        created_at as ordered_at
    from raw.ecomm.orders_{{ country }}
), 

customers as (
    select
        *
    from {{ ref('stg_ecomm__customers') }}
),

customer_metrics as (
    select
        customer_id,
        count(*) as count_orders,
        min(ordered_at) as first_order_at,
        max(ordered_at) as most_recent_order_at
    from orders
    group by 1

),

joined as (
    select
        customers.*,
        coalesce(customer_metrics.count_orders,0) as count_orders,
        customer_metrics.first_order_at,
        customer_metrics.most_recent_order_at
    from customers
    left join customer_metrics on (
        customers.customer_id = customer_metrics.customer_id
    )
    {% if dev_limit %}
    where most_recent_order_at >= dateadd('day', -90, '2021-01-01')
    {% endif %}
)

select
    *
from joined
