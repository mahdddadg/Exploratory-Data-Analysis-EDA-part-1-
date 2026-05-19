
--here to exploare , first and las torders and have knowlege abour customers age
select

min(order_date ) as first ,
max(order_date ) as last ,
datediff( month , min(order_date ) ,max(order_date )) as range

from gold.facts_sales



select

min(birthdate) as first ,
max(birthdate ) as last ,
datediff(year ,max(birthdate ) , getdate()  ) as youngest 

from gold.dim_customers
