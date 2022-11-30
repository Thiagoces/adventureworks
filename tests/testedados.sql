with validacao as (
    select 
        sum(unit_price) as sum_val
    from {{ref ('fct_orders')}}
)

select * from validacao 
where sum_val != 56423747.6147