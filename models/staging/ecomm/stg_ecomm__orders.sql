with

source as (

    select * from {{ source('ecomm', 'orders') }}

),

renamed as (

    select
        id as order_id,
        customer_id,
        amount,
        created_at,

    from source

)

select * from renamed
