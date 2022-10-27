with sales_person as (
    select 
      territoryid as territory_id
     , businessentityid as business_entity_id
     , saleslastyear as sales_last_year
     , commissionpct as comission_pct
     , bonus
     , salesytd as sales_ytd
     , salesquota as sales_quota

    from {{source('adventureworks', 'salesperson')}}

)

select * from sales_person