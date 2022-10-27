with sales_reason as (
    select 
      salesreasonid as sales_reason_id
     , name
     , reasontype as reason_type
    
    from {{source ('adventureworks', 'salesreason')}}
)

select * from sales_reason