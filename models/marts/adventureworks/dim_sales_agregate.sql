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

transform as (
    
    select 
        order_header.sales_order_id
        , order_header.customer_id
        , order_header.territory_id
        , order_header.creditcard_id
        , order_header.ship_to_address_id
        , order_header.order_date
        , order_header.status
        , sales_order_header_sales_reason.sales_reason_id
        , sales_reason.name as reason_name
        , creditcard.card_type
        , (row_number () over (partition by order_header.sales_order_id order by order_header.order_date)) as one_reason
                
    from order_header
    left join sales_order_header_sales_reason
    on sales_order_header_sales_reason.sales_order_id = order_header.sales_order_id
    left join sales_reason
    on sales_order_header_sales_reason.sales_reason_id = sales_reason.sales_reason_id
    left join creditcard
    on order_header.creditcard_id = creditcard.creditcard_id
    
),

sales_agregate as (
    select 
        sales_order_id
        , customer_id
        , territory_id
        , creditcard_id
        , ship_to_address_id
        , order_date
        , status
        , sales_reason_id
        , reason_name
        , card_type

    from transform
    where one_reason = 1
)

select * from sales_agregate

-- with
-- first_step as (
--   select
--     sh.salesorderid
--    , sr.salesreasonid
--    , sh.orderdate
--    , (row_number () over (partition by sh.salesorderid order by sh.orderdate)) as d
--   from `adventureworksdw.sales_salesorderheader` as sh
--  left join adventureworksdw.sales_salesorderheadersalesreason as sr on sh.salesorderid = sr.salesorderid
-- )

-- select salesorderid, d, salesreasonid from first_step
-- where d = 1