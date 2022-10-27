with stores as (
    select 
       salespersonid as sales_person_id
     , businessentityid as business_entity_id
     , name
    from {{source ('adventureworks', 'store')}}
)

select * from stores