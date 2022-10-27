with sales_order_details as (
    select
    salesorderdetailid as sales_order_detail_id
     , salesorderid as sales_order_id
     , productid as product_id
     , specialofferid as special_offer_id
     , orderqty as order_qtd
     , unitprice as unit_price
     , unitpricediscount as unit_price_discount
    
    from {{source ('adventureworks', 'salesorderdetail')}}
)

select * from sales_order_details