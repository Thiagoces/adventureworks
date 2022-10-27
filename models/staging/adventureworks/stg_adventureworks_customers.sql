with customers as (
    select 
      customerid as customer_id
     , concat(firstname,' ', lastname) as customer_name
     , companyname as company_name
    from {{source ('adventureworks','customer')}}

)

select * from customers