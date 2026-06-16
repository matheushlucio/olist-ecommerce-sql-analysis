select *
from ecommerce_olist.olist_order_items_dataset ooid 

-- Quantos itens foram vendidos:

select 
	count(*) as qtde_vendida
from ecommerce_olist.olist_order_items_dataset ooid 

-- Receita total dos produtos

select
	-- NUMERIC converte o resultado da soma em númerico
	round(sum(price)::numeric, 2) as receita_total
from ecommerce_olist.olist_order_items_dataset ooid 

-- Valor médio dos produtos vendidos

select
	round(avg(price)::numeric, 2) as valor_medio_produto
from ecommerce_olist.olist_order_items_dataset ooid

-- Valor do frete médio

select 
	round(avg(freight_value)::numeric, 2) as valor_medio_frete
from ecommerce_olist.olist_order_items_dataset ooid 

-- Produto mais caro vendido

select 
	ooid.product_id,
	ooid.price 
from ecommerce_olist.olist_order_items_dataset ooid 
order by ooid.price desc
limit 5

-- Categoria com produtos mais caro vendidos

select
	opd.product_category_name,
	max(ooid.price) as max_preco
from ecommerce_olist.olist_order_items_dataset ooid
left join ecommerce_olist.olist_products_dataset opd
on ooid.product_id = opd.product_id
group by opd.product_category_name 
order by max_preco desc
limit 10

-- Seller com mais vendas

select 
	ooid.seller_id,
	count(*) as total_itens
from ecommerce_olist.olist_order_items_dataset ooid 
group by ooid.seller_id
order by total_itens desc
limit 10