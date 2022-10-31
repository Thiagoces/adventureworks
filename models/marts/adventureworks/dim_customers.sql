with 
customer as (
    select 
    * 
    from {{ref('stg_adventureworks_customers')}}
),

person as (
    select 
    *
    from {{ref('stg_adventureworks_person')}}
    
),

customer_person as (
  select
    customer.customer_id
    , customer.person_id
    , customer.store_id
    , customer.territory_id
    , person.business_entity_id 
    , person.name as customer_name
    , person.person_type
    , person.email_promotion
  from customer
  inner join person on person.business_entity_id = customer.person_id
  
)

select * from customer_person