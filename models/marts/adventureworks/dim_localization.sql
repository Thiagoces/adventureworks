with 
city as (
    select 
    *
    from {{ref ('stg_adventureworks_address')}}
),

state as (
    select 
    *
    from {{ref('stg_adventureworks_state_province')}}
),

country as (
    select 
    *
    from {{ref('stg_adventureworks_country_region')}}

),

localization as (
    select
      country.country_region_code
     , country.country_name 
     , state.name as state_name
     , city.city
     , state.state_province_id
     , state.territory_id
     , city.address_id

    from country
    left join state 
    on state.country_region_code = country.country_region_code
    left join city 
    on city.state_province_id = state.state_province_id
)

select * from localization
