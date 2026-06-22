select * from ecommerce_olist.olist_order_payments_dataset oopd 

-- Faturamento total

select
	sum(oopd.payment_value) as faturamento_total
from ecommerce_olist.olist_order_payments_dataset oopd 

-- Métodos de pagamento mais utilizados

select 
	oopd.payment_type,
	count(oopd.payment_type) as qtde
from ecommerce_olist.olist_order_payments_dataset oopd
group by oopd.payment_type
order by qtde desc

-- Receita por método de pagamento

select
	oopd.payment_type,
	sum(oopd.payment_value) as receita
from ecommerce_olist.olist_order_payments_dataset oopd
group by oopd.payment_type
order by receita desc

-- Quantidade de parcelas mais utilizada

select
	oopd.payment_installments,
	count(oopd.payment_installments) as qtde_parcelas
from ecommerce_olist.olist_order_payments_dataset oopd 
group by oopd.payment_installments
order by qtde_parcelas desc
limit 5

-- Participação de cada método no faturamento total

-- tenho que somar o faturamento de cada método primeiro para obter a participação real de cada um no faturamento total
with faturamento_por_metodo as (
	select 
		oopd.payment_type,
		sum(oopd.payment_value) as faturamento_total_metodo
	from ecommerce_olist.olist_order_payments_dataset oopd 
	group by oopd.payment_type
)

select 
	payment_type,
	faturamento_total_metodo,
	round(
		((faturamento_total_metodo / sum(faturamento_total_metodo) over()) * 100)::numeric, 2
	) as percentual_participacao
from faturamento_por_metodo
order by percentual_participacao desc