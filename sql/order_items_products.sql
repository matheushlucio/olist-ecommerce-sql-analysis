-- Quais categorias mais venderam?

select 
	opd.product_category_name,
	count(*) as total_vendido_categoria
from ecommerce_olist.olist_order_items_dataset ooid 
join ecommerce_olist.olist_products_dataset opd
on ooid.product_id = opd.product_id
group by opd.product_category_name
order by total_vendido_categoria desc
limit 10

-- Quais categorias geraram mais receita?

select
	opd.product_category_name,
	round(sum(price)::numeric, 2) as total_receita
from ecommerce_olist.olist_order_items_dataset ooid
join ecommerce_olist.olist_products_dataset opd
on ooid.product_id = opd.product_id
group by opd.product_category_name
order by total_receita desc
limit 10

-- Preço médio por categoria

select 
	opd.product_category_name,
	round(avg(price)::numeric, 2) as preco_medio_categoria
from ecommerce_olist.olist_order_items_dataset ooid
join ecommerce_olist.olist_products_dataset opd
on ooid.product_id = opd.product_id 
group by opd.product_category_name
order by preco_medio_categoria desc
limit 10

-- Top 10 produtos mais vendidos

select 
	ooid.product_id,
	count(*) as total_vendido_produto
from ecommerce_olist.olist_order_items_dataset ooid
group by ooid.product_id 
order by total_vendido_produto desc
limit 10

-- Categorias com frete mais caro

select 
	opd.product_category_name,
	round(avg(freight_value)::numeric, 2) as frete_mais_caro
from ecommerce_olist.olist_order_items_dataset ooid 
join ecommerce_olist.olist_products_dataset opd 
on ooid.product_id = opd.product_id 
group by opd.product_category_name
order by frete_mais_caro desc
limit 10