with 
product as (
    select 
    * 
    from {{ref('stg_adventureworks_products')}}
),

order_detail as (
    select 
    *
    from {{ref('stg_adventureworks_sales_order_details')}}
    
    ),

product_order as (
    select 
      order_detail.sales_order_id
      , order_detail.product_id
      , product.product_name
      , order_detail.order_qtd
      , order_detail.unit_price
      , order_detail.unit_price_discount
      , order_detail.special_offer_id
    from order_detail
    left join product on product.product_id = order_detail.product_id
    
)

select * from product_order


