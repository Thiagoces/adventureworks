with 
    sales_order_header as (
        select 
            salesorderid as sales_order_id
            , customerid as customer_id
            , salespersonid as sales_person_id
            , shipmethodid as ship_method_id 
            , shiptoaddressid as ship_to_address_id
            , billtoaddressid	as bill_to_address_id
            , territoryid as territory_id
            , currencyrateid as currency_rate_id
            , subtotal 
            , freight
            , taxamt
            , totaldue as total_due
            , creditcardid as creditcard_id
            , accountnumber as account_number
            , revisionnumber as revision_number
            , orderdate as order_date
            , status
            , duedate as due_date
            , shipdate  as ship_date
        from {{source ('adventureworks', 'salesorderheader') }}
    )
select * 
from sales_order_header