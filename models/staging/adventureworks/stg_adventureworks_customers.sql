with customers as (
    select 
      customerid as customer_id
     , personid as person_id
     , storeid as store_id
     , territoryid as territory_id
     , concat(firstname,' ', lastname) as customer_name
     , companyname as company_name
    from {{source ('adventureworks','customer')}}

)

select * from customers