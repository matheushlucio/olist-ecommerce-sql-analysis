# %%
import pandas as pd

df = pd.read_csv(r'..\data\olist_orders_dataset.csv')
df.head()

# %%
# 1. Distribuição dos status dos pedidos.

# Agrupa os status, conta quantos pedidos existem em cada status, ordena a quantidade de pedidos do maior para o menor e renomeia as colunas para facilitar a leitura.
distribuicao_status_pedidos = (
    df.groupby('order_status', as_index=False)[['order_id']]
    .count()
    .sort_values(by='order_id', ascending=False)
    .rename(columns={
            'order_status':'status',
            'order_id':'qtde'
            }
        )
)

total_pedidos = distribuicao_status_pedidos['qtde'].sum()

# Calcula o percentual que cada status representa em relação ao total de pedidos.
distribuicao_status_pedidos['percentual'] = (
    distribuicao_status_pedidos['qtde'] / total_pedidos * 100
)

distribuicao_status_pedidos

# %%
# 2. Top 10 meses com mais pedidos

# Converte as colunas de datas para o tipo datetime, extrai o ano e o mês da compra,  agrupa os pedidos por ano e mês, conta a quantidade de pedidos em cada período e exibe os 10 primeiros resultados.
df['order_purchase_timestamp'] = pd.to_datetime(df['order_purchase_timestamp'])

df['ano_mes'] = df['order_purchase_timestamp'].dt.strftime('%Y-%m')

pedidos_por_mes = df.groupby('ano_mes')['order_id'].nunique().sort_values(ascending=False).head(10)
pedidos_por_mes

# %%
# 3. Tempo médio entre compra e entrega.

# Converte as colunas de datas para o tipo datetime, calcula o tempo de entrega em dias e, por fim, calcula a média de dias entre a compra e a entrega.
df['order_delivered_customer_date'] = pd.to_datetime(df['order_delivered_customer_date'])
df['order_purchase_timestamp'] = pd.to_datetime(df['order_purchase_timestamp'])

df['tempo_entrega_dias'] = (
    df['order_delivered_customer_date'] - df['order_purchase_timestamp']
).dt.days

media_entrega_dias = df['tempo_entrega_dias'].mean()
media_entrega_dias.round(2)

# 4. Quantidade de pedidos atrasados.

# data real da entrega > data estimada

# condicao logica, 'a entrega aconteceu depois do prazo' onde sim = atrasad e nao = no prazo

# 5. Tempo médio de atraso dos pedidos.