-- Estados com mais pedidos

select 
	ocd.customer_state,
	count(*) as total_pedidos
from ecommerce_olist.olist_orders_dataset ood 
join ecommerce_olist.olist_customers_dataset ocd 
on ood.customer_id = ocd.customer_id
group by ocd.customer_state
order by total_pedidos desc
limit 10

-- Cidades com mais pedidos

select 
	ocd.customer_city,
	count(*) as total_pedidos
from ecommerce_olist.olist_orders_dataset ood
join ecommerce_olist.olist_customers_dataset ocd 
on ood.customer_id = ocd.customer_id
group by ocd.customer_city
order by total_pedidos desc
limit 10

-- Clientes com mais pedidos

select
	ocd.customer_unique_id,
	count(*) as total_pedidos
from ecommerce_olist.olist_orders_dataset ood
join ecommerce_olist.olist_customers_dataset ocd 
on ood.customer_id = ocd.customer_id
group by ocd.customer_unique_id
order by total_pedidos desc
limit 10

-- Clientes que compraram apenas uma vez
-- O uso de COUNT(COLUNA) em vez de COUNT(*) serve para garantir a precisão dos dados, embora na maioria das vezes o resultado seja idêntico.

select
	ocd.customer_unique_id,
	count(ood.order_id) as total_pedidos
from ecommerce_olist.olist_orders_dataset ood
join ecommerce_olist.olist_customers_dataset ocd 
on ood.customer_id = ocd.customer_id
group by ocd.customer_unique_id
having count(ood.order_id) = 1

-- Evolução mensal dos pedidos

select
	to_char(ood.order_purchase_timestamp::timestamp, 'YYYY - MM') as ano_mes,
	count(order_id) as total_pedidos
from ecommerce_olist.olist_orders_dataset ood
group by ano_mes
order by ano_mes	