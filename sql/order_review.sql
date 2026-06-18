-- Distribuição das notas

select
	oord.review_score,
	count(oord.review_score) as qtde
from ecommerce_olist.olist_order_reviews_dataset oord
group by oord.review_score
order by oord.review_score desc

-- Nota média geral

select 
	round(avg(oord.review_score)::numeric,2) as media
from ecommerce_olist.olist_order_reviews_dataset oord

-- Nota média por status do pedido

select
	ood.order_status,
	round(avg(oord.review_score)::numeric, 2) as media
from ecommerce_olist.olist_order_reviews_dataset oord
join ecommerce_olist.olist_orders_dataset ood
on oord.order_id = ood.order_id 
group by ood.order_status 

-- Pedidos atrasados x nota média

select 
	case
		when ood.order_delivered_customer_date > ood.order_estimated_delivery_date then 'Atrasado'
		when ood.order_delivered_customer_date <= ood.order_estimated_delivery_date then 'No Prazo'
		else 'Não Entregue'
	end as status_entrega,
	count(distinct ood.order_id) as total_pedido,
	round(avg(oord.review_score)::numeric, 2) as media
from ecommerce_olist.olist_orders_dataset ood 
join ecommerce_olist.olist_order_reviews_dataset oord
on ood.order_id = oord.order_id

-- DELIVERED, foca apenas em pedidos que já foram finalizados
where ood.order_status = 'delivered'
group by status_entrega
order by media desc

-- Evolução mensal das avaliações

select 
    to_char(oord.review_creation_date::timestamp, 'YYYY-MM') AS ano_mes,
    count(oord.review_id) AS total_avaliacoes,
    round(avg(oord.review_score)::numeric, 2) AS nota_media_mensal
from ecommerce_olist.olist_order_reviews_dataset oord
group by ano_mes
order by ano_mes asc
