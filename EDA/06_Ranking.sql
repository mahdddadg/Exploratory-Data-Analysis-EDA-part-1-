-- 5 products that generate the highest revenue : 


select top 5

dp.product_name ,
sum(fs.sales_amount) as revenue ,
rank () over (order by sum(fs.sales_amount) desc ) rank_products


from gold.dim_products as dp
left join gold.facts_sales as fs
on dp.product_key = fs.product_key
group by dp.product_name
order by dp.product_name desc


---
select
*
from (
select 
dp.product_name ,
sum(fs.sales_amount) as revenue ,
row_number () over (order by sum(fs.sales_amount) desc ) rank_products


from gold.dim_products as dp
left join gold.facts_sales as fs
on dp.product_key = fs.product_key
group by dp.product_name
)t where rank_products < = 5


-- 5 5 products that generate the lowest revenue : 



select top 5

dp.product_name ,
sum(fs.sales_amount) as revenue ,
rank () over (order by sum(fs.sales_amount) asc ) rank_products


from gold.dim_products as dp
left join gold.facts_sales as fs
on dp.product_key = fs.product_key
group by dp.product_name
order by dp.product_name asc 


--actuallt using ramk() in this senario is not the best cast becuase we might hva nulls 
-- in our dataset , so it is better to only use order by ...


select
*
from (
select 

dp.product_name ,
sum(fs.sales_amount) as revenue ,
row_number  () over (order by sum(fs.sales_amount) asc ) rank_products


from gold.dim_products as dp
left join gold.facts_sales as fs
on dp.product_key = fs.product_key
group by dp.product_name
)t  where rank_products < = 5



--- top 10 customers with highest revenu and 3 customers withe lowest revenue : 

select top 10 

dc.customer_key ,
dc.first_name + ' ' + dc.last_name , 
sum(fs.sales_amount) as totall_revenue 



from gold.facts_sales as fs
left join gold.dim_customers as dc
on dc.customer_key = fs.customer_key
group by dc.customer_key ,
dc.first_name ,
dc.last_name
order by totall_revenue desc


select top 3

dc.customer_key ,
dc.first_name + ' ' + dc.last_name , 
count(distinct order_number) as totall_revenue 



from gold.facts_sales as fs
left join gold.dim_customers as dc
on dc.customer_key = fs.customer_key
group by dc.customer_key ,
dc.first_name ,
dc.last_name
order by totall_revenue asc
