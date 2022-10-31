with creditcard as (
    select 
        creditcardid as creditcard_id
        , cardtype as card_type
        , cardnumber as card_number
        , expyear as exp_year
        , expmonth as exp_month 
    from {{source ('adventureworks', 'creditcard')}}
)

select * from creditcard