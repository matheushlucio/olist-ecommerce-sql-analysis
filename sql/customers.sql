-- total de clientes

select
	count(distinct ocd.customer_unique_id) as total_clientes
from ecommerce_olist.olist_customers_dataset ocd

-- top 5 estados com mais clientes

select
	count(*) as total_estado,
	ocd.customer_state
from ecommerce_olist.olist_customers_dataset ocd
group by ocd.customer_state
order by total_estado desc
limit 5

-- top 5 cidades com mais clientes

select 
	count(*) AS total_cidade,
	ocd.customer_city
from ecommerce_olist.olist_customers_dataset ocd
group by ocd.customer_city
order by total_cidade desc
limit 5

-- top 5 cidades com mais clientes de cada estado

with ranking_cidades as (
	select 
		count(ocd.customer_id) as total_cliente,
		ocd.customer_city,
		ocd.customer_state,
		row_number() over (
			partition by ocd.customer_state
			order by count(distinct ocd.customer_unique_id) desc
		) as ranking
	from ecommerce_olist.olist_customers_dataset ocd 
	group by ocd.customer_city, ocd.customer_state
)
select 
	customer_state,
	customer_city,
	total_cliente,
	ranking
from ranking_cidades 
where ranking <= 5 
order by customer_state, ranking;

-- quais são os 10 CEP com maior quantidade de clientes únicos

with ranking_ceps as (
    select 
        ocd.customer_zip_code_prefix,
        ocd.customer_city,
        ocd.customer_state,
        count(distinct ocd.customer_unique_id) as total_clientes,
        row_number() over (
            order by count(distinct ocd.customer_unique_id) desc
        ) as ranking
    from ecommerce_olist.olist_customers_dataset ocd
    group by
        ocd.customer_zip_code_prefix,
        ocd.customer_city,
        ocd.customer_state
)
select ranking, customer_zip_code_prefix, customer_state, customer_city, total_clientes
from ranking_ceps
where ranking <= 10
order by ranking