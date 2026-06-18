-- Top 10 vendedores por faturamento

select 
	ooid.seller_id,
	sum(price) as total_faturamento
from ecommerce_olist.olist_order_items_dataset ooid
group by ooid.seller_id
order by total_faturamento desc
limit 10

-- Top 10 vendedores por quantidade vendida

select 
	ooid.seller_id,
	count(price) as total_vendido
from ecommerce_olist.olist_order_items_dataset ooid
group by ooid.seller_id
order by total_vendido desc
limit 10

-- Receita por estado do vendedor

select 
	ooid.seller_id,
	osd.seller_state,
	sum(ooid.price) as receita_vendedor
from ecommerce_olist.olist_order_items_dataset ooid
join ecommerce_olist.olist_sellers_dataset osd
on ooid.seller_id = osd.seller_id
group by ooid.seller_id, osd.seller_state 
order by receita_vendedor desc
limit 10

-- Top 5 vendedores de cada estado

with ranking_estado as (
	select
		count(*) as total_vendas,
		osd.seller_id,
		osd.seller_state,
		row_number() over (
			partition by osd.seller_state
			order by count(ooid.seller_id) desc
		) as ranking
	from ecommerce_olist.olist_order_items_dataset ooid 
	join ecommerce_olist.olist_sellers_dataset osd
	on ooid.seller_id = osd.seller_id
	group by osd.seller_id, osd.seller_state 
)
select
	seller_id,
	seller_state,
	total_vendas 
from ranking_estado
where ranking <= 5
order by seller_state

-- Quanto cada vendedor vendeu em média?

select
	ooid.seller_id,
	round(avg(price)::numeric, 2) as media_vendida
from ecommerce_olist.olist_order_items_dataset ooid
group by seller_id