
-- find totall sales :

select sum(sales_amount ) as total_sales from gold.facts_sales

--- how many item are sold 
select count(sales_amount ) as total_quantity from gold.facts_sales

-- avrage saling price : 
select avg(price) as avg_price from gold.facts_sales

--totall number of order : 
select count(order_number) as totall_order from gold.facts_sales
select count(distinct order_number) as totall_order from gold.facts_sales -- more acuate
select * from  gold.facts_sales

--totall number of products 

select count(product_key) as totall_product from gold.dim_products
select count(distinct product_name) as totall_product from gold.dim_products



-- totall number o fcustomers 


select count(distinct customer_key) as totall_csutomers from gold.dim_customers


-- totall customers who maade an orders 

select count(distinct customer_key) as totall_csutomers from gold.facts_sales
-- so all registred customers made an order .

----------------------------------------------------------------------------------------

-- here a totall overview ( big number )in one single query : 

select 'total_sales'as measure_name , sum(sales_amount ) as measure_value from gold.facts_sales

union all

select 'total_quantity' as measure_name, count(sales_amount ) as measure_value   from gold.facts_sales

union all

select 'avg_price'as measure_name , avg(price) as measure_value  from gold.facts_sales

union all

select  'totall_order'as measure_name , count(distinct order_number) as measure_value  from gold.facts_sales

union all


select 'totall_product'as measure_name , count(distinct product_name) as measure_value  from gold.dim_products


union all

select 'totall_csutomers' as measure_name ,count(distinct customer_key) as measure_value  from gold.dim_customers

union all

select 'totall_sales'as measure_name , count(distinct customer_key) as measure_value  from gold.facts_sales
