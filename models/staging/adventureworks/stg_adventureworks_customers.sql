with customers as (
    select 
      customerid as customer_id
     , personid as person_id
     , storeid as store_id
     , territoryid as territory_id
     
    from {{source ('adventureworks','customer')}}

)

select * from customers