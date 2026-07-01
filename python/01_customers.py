# %%
import pandas as pd

df = pd.read_csv(r'..\data\olist_customers_dataset.csv')
df.head()

# %%
# 1. Qual estado possui mais clientes?

# Conta quantas vezes cada estado aparece na coluna 'customer_state' e guarda o estado com maior quantidade na variável 'top_estado'.
top_estado = df['customer_state'].value_counts().head(1)

# Não aparecer o nome da coluna na saída.
estado = top_estado.index[0]
quantidade = top_estado.iloc[0]

print(f'O estado com mais clientes é {estado} com {quantidade} clientes.')

# %%
# 2. Quais são as 10 cidades com mais clientes?

# Conta quantos clientes existem em cada estado e seleciona as 10 cidades com maior quantidade de clientes.
top_cidades = df['customer_city'].value_counts().head(10)
print(f'As 10 cidades com mais clientes são: {top_cidades}')

# %%
# 3. Quantos clientes únicos existem?

# Conta quantos IDs únicos existem na coluna 'customer_unique_id' obtendo a quantidade de clientes distintos.
clientes_unicos = df['customer_unique_id'].nunique()
print(f'Possui {clientes_unicos} clientes únicos.')

# %%
# 4. Qual estado possui maior número de cidades cadastradas?

# Agrupa os dados por estado, conta quantas cidades diferentes existem em cada um, ordena do maior para o menor e seleciona o estado com mais cidades cadastradas.
qtd_cidades_por_estado = df.groupby(by='customer_state')['customer_city'].nunique().sort_values(ascending=False).head(1)
print(f'O estado que possui maior número de cidades é: {qtd_cidades_por_estado}')

# %%
# 5. Quais CEPs concentram mais clientes?

# Agrupa clientes por cidade e CEP, conta quantos clientes existem em cada grupo, ordena do maior para o menor, seleciona os 10 CEPs com mais clientes e renomeia as colunas para facilitar a leitura.
clientes_por_cep = (
    df.groupby(['customer_city', 'customer_zip_code_prefix'])
    .size()
    .reset_index(name='qtd_clientes')
    .sort_values('qtd_clientes', ascending=False)
    .head(10)    
    .rename(columns={
        'customer_city': 'cidade',
        'customer_zip_code_prefix': 'cep'
    })
    .reset_index(drop=True)
)
clientes_por_cep