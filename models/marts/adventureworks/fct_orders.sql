 with 
sales_agregate as (
    select 
    *
    from {{ref ('dim_sales_agregate')}}
),

product as (
    select 
    * 
    from {{ref ('dim_products')}}
),

localization as (
    select 
    *
    from {{ref('dim_localization')}}
),

customer as (
    select 
    *
    from {{ref('dim_customers')}}
),

joined as (
    select
          sales_agregate.sales_order_id
        , sales_agregate.ship_to_address_id
        , sales_agregate.customer_id
        , sales_agregate.territory_id
        , sales_agregate.creditcard_id
        , sales_agregate.sales_reason_id
        , sales_agregate.order_date
        , sales_agregate.status
        , sales_agregate.reason_name
        , sales_agregate.card_type
        , product.product_id
        , product.product_name
        , product.order_qtd
        , product.unit_price
        , product.unit_price_discount
        , localization.country_region_code
        , localization.country_name 
        , localization.state_name
        , localization.city
        , customer.customer_name

    from sales_agregate
    left join product 
    on product.sales_order_id = sales_agregate.sales_order_id
    left join localization
    on localization.address_id = sales_agregate.ship_to_address_id
    left join customer
    on customer.customer_id = sales_agregate.customer_id

),


fct_orders as (
    select 
       joined.sales_order_id
       , joined.customer_id
       , joined.creditcard_id
       , joined.territory_id
       , joined.sales_reason_id
       , joined.product_id
       , joined.product_name
       , joined.reason_name
       , joined.order_qtd
       , joined.unit_price
       , joined.unit_price_discount
       , joined.status
       , joined.country_name
       , joined.state_name
       , joined.city
       , joined.card_type
       , joined.customer_name
       , joined.order_date
  
    from joined
 )

 select * from fct_orders