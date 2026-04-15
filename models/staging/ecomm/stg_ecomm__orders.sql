with source as (
  select
    *
  from {{ source('ecomm', 'orders') }}
),


renamed as (
  select
    id as customer_id,
    'USD' as currency,
    *
  from source
),


final as (
  select
    *
  from renamed
)


select
  *
from final
