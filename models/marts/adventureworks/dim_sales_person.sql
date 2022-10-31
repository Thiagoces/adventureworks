with 
salesperson as (
    select 
    * 
    from {{ref('stg_adventureworks_sales_person')}}
),

employee as (
    select 
    * 
    from {{ref('stg_adventureworks_employee')}}
),

person as (
    select
    *
    from {{ref('stg_adventureworks_person')}}
),

sales_person as (
    select 
      employee.business_entity_id
      , person.name as employee_name
      , salesperson.territory_id
      , salesperson.sales_last_year
      , salesperson.comission_pct
      , salesperson.sales_ytd
      , salesperson.sales_quota
      , salesperson.bonus

    from employee
    inner join person on employee.business_entity_id = person.business_entity_id
    inner join salesperson on employee.business_entity_id = salesperson.business_entity_id
)

select * from sales_person