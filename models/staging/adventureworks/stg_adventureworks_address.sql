with addres as (
    select 
      addressid as address_id
      , stateprovinceid as state_province_id
      , postalcode as postal_code
      , concat(addressline1, ' ',addressline2) as address_name
      , city

    from {{source('adventureworks', 'address')}}
)

select * from addres
