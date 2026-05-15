

-- to explore all countries where customers come from 
select
distinct country 
from gold.dim_customers



-- to explore all categories ' the major divisions ' 
select
distinct category , subcategory ,product_name
from gold.dim_products
order by 1,2,3
