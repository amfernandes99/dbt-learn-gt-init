with payments as (
    select * from {{ ref('stg_stripe__payments') }}
),

orders as (
    select * from {{ ref('stg_jaffle_shop_orders') }}
)

select
    orders.order_id,
    orders.customer_id,
    payments.amount

from orders

left join payments
    on orders.order_id = payments.order_id