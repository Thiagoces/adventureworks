with products as (
    select
     productid as product_id
     , productnumber as product_number
     , name as product_name

    from {{source ('adventureworks', 'product')}}
)

select * from products