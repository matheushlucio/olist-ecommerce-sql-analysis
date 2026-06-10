-- Quantidade total de pedido:

select
	count(*) as total_pedido
from ecommerce_olist.olist_orders_dataset ood 

-- Status do pedido:
select distinct 
	ood.order_status,
	count(*) as total_pedidos
from ecommerce_olist.olist_orders_dataset ood
group by ood.order_status 
order by total_pedidos desc

-- Tempo médio de entregas:
select 
	avg(cast(ood.order_delivered_customer_date as timestamp) - cast(ood.order_purchase_timestamp as timestamp)
	) as tempo_medio_entrega
from ecommerce_olist.olist_orders_dataset ood
where ood.order_delivered_customer_date is not null

-- tratamento para strings vazias, pois estava dando erro ao calcular a média por cauda delas
and order_delivered_customer_date <> ''
and order_purchase_timestamp is not null
and order_purchase_timestamp <> '';

-- Pedidos atrasaos:
select 
	count(*) as pedidos_atrasados
from ecommerce_olist.olist_orders_dataset ood 
where ood.order_delivered_customer_date > ood.order_estimated_delivery_date

-- Pedidos po mês
select
	date_trunc('month', cast(ood.order_purchase_timestamp as timestamp)) as mes,
	count(*) as total_pedidos
from ecommerce_olist.olist_orders_dataset ood 

-- o '1' significa que é para agrupar pela primeira coluna/linha da SELECT que seria a 'date_trunc'
group by 1
order by 1