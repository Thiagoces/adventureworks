with state_province as (
    select 
      stateprovinceid as state_province_id
      , territoryid as territory_id
      , stateprovincecode as state_province_code
      , countryregioncode as country_region_code
      , name

    from {{ source ('adventureworks', 'stateprovince')}}

)

select * from state_province