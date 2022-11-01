with
order_header as (
    select 
    * 
    from {{ref ('stg_adventureworks_sales_order_header')}}
),

sales_reason as (
    select
    *
    from {{ref ('stg_adventureworks_sales_reason')}}


),

sales_order_header_sales_reason as (
    select
    * 
    from {{ref ('stg_adventureworks_sales_order_header_sales_reason')}}
),

creditcard as (
    select 
    *
    from {{ref ('stg_adventureworks_sales_creditcard')}}
),


sales_agregate as (
    
    select 
        order_header.sales_order_id
        , order_header.customer_id
        , order_header.territory_id
        , order_header.creditcard_id
        , order_header.order_date
        , order_header.status
        , sales_order_header_sales_reason.sales_reason_id
        , sales_reason.name as reason_name
        , creditcard.card_type
                
    from order_header

    left join sales_order_header_sales_reason
    on sales_order_header_sales_reason.sales_order_id = order_header.sales_order_id
    left join sales_reason
    on sales_order_header_sales_reason.sales_reason_id = sales_reason.sales_reason_id
    left join creditcard
    on order_header.creditcard_id = creditcard.creditcard_id
)

select * from sales_agregate