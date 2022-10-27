with sales_person_quota_history as (
    select 
     businessentityid as business_entity_id
     , salesquota as sales_quota
     , quotadate as quota_date
    
    from {{ source('adventureworks', 'salespersonquotahistory') }}

)

select * from sales_person_quota_history