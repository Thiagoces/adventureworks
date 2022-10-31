with employee as (
    select 
      nationalidnumber	as national_number_id
      , businessentityid as business_entity_id
      , loginid as login_in
      , jobtitle as job_title
      , gender
      , vacationhours as vacation_hours
      , sickleavehours as sick_leave_hours
      , hiredate as hire_date
      , birthdate as bith_date
      , currentflag as inactive_or_active	
    
    from {{source ('adventureworks', 'employee') }}

)

select * from employee