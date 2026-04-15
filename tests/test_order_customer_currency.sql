select
  o.order_id
from {{ ref('orders') }} o
inner join {{ ref('customers') }} c
  on o.customer_id = c.customer_id
where o.currency != c.currency