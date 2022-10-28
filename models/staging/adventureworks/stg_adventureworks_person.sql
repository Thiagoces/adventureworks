with person as (
    select 
      businessentityid as business_entity_id
      , concat(firstname, ' ', lastname) as name
      , persontype as person_type
      , emailpromotion as email_promotion
    
    
    from {{ source('adventureworks', 'person') }}

)

select * from person