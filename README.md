# Análise de Dados E-commerce Olist com SQL

## Visão Geral

Este projeto apresenta uma análise detalhada do dataset público da Olist, uma plataforma de e-commerce brasileira. O foco principal é a utilização de **SQL** para explorar e extrair insights valiosos sobre o comportamento de clientes, vendas, pagamentos e avaliações. O objetivo é demonstrar proficiência em análise de dados relacional e extrair informações acionáveis para otimização de negócios.

## Objetivo

O principal objetivo deste projeto é realizar uma análise exploratória e descritiva aprofundada do dataset da Olist, utilizando consultas SQL complexas, para:

- **Compreender o perfil do cliente:** Identificar a distribuição geográfica e a concentração de clientes.
- **Analisar o ciclo de vida do pedido:** Rastrear a evolução, status e eficiência de entrega dos pedidos.
- **Avaliar o desempenho financeiro:** Entender os métodos de pagamento, parcelamento e a contribuição de cada um para a receita.
- **Medir a satisfação do cliente:** Analisar as avaliações e sua correlação com fatores como atrasos na entrega.

## Dataset

O dataset utilizado é o **"Brazilian E-Commerce Public Dataset by Olist"**, disponível no Kaggle [1]. Ele abrange 100.000 pedidos realizados entre 2016 e 2018. As tabelas contêm informações ricas sobre:

- **Pedidos:** Status, datas de compra e entrega, IDs de clientes e vendedores.
- **Clientes:** Localização (estado, cidade, CEP) e IDs únicos.
- **Itens de Pedido:** Produtos, preços, frete e vendedores associados.
- **Pagamentos:** Tipo de pagamento, valor e número de parcelas.
- **Avaliações:** Notas e comentários dos clientes.
- **Produtos:** Categorias e descrições.
- **Vendedores:** Localização.

## Ferramentas e Tecnologias

- **PostgreSQL:** Sistema de gerenciamento de banco de dados relacional para armazenamento e execução das queries.
- **SQL:** Linguagem de consulta estruturada para todas as análises de dados.
- **Git:** Sistema de controle de versão.
- **GitHub:** Plataforma de hospedagem de código para colaboração e versionamento do projeto.

## Estrutura do Projeto

```
. 
├── README.md
└── sql/
    ├── customers.sql
    ├── order_customers.sql
    ├── order_items.sql
    ├── order_items_products.sql
    ├── order_items_sellers.sql
    ├── order_payments.sql
    ├── order_review.sql
    └── orders.sql
```

## Análises Realizadas (Queries SQL)

As análises foram estruturadas em arquivos SQL dedicados, cada um focando em um aspecto específico do negócio:

### 1. Clientes (`customers.sql`, `order_customers.sql`)

- **Total de Clientes:** Contagem de clientes únicos na base de dados.
- **Distribuição Geográfica:** Identificação dos top 5 estados e cidades com maior número de clientes.
- **Concentração por CEP:** Análise dos 10 CEPs com maior quantidade de clientes únicos.
- **Cidades por Estado:** Ranking das top 5 cidades com mais clientes em cada estado.

### 2. Pedidos (`orders.sql`, `order_items.sql`, `order_items_products.sql`, `order_items_sellers.sql`)

- **Volume Total de Pedidos:** Quantidade total de pedidos registrados.
- **Status dos Pedidos:** Distribuição percentual dos diferentes status (entregues, cancelados, processando, etc.).
- **Tempo de Entrega:** Cálculo do tempo médio de entrega e identificação de pedidos atrasados.
- **Evolução Mensal:** Análise da quantidade de pedidos por mês para identificar tendências.

### 3. Pagamentos (`order_payments.sql`)

- **Faturamento Total:** Soma total dos valores de pagamento.
- **Métodos de Pagamento:** Identificação dos métodos mais utilizados e a receita gerada por cada um.
- **Parcelamento:** Análise da frequência e impacto do número de parcelas nas transações.
- **Participação na Receita:** Cálculo da contribuição percentual de cada método de pagamento para o faturamento total.

### 4. Avaliações (`order_review.sql`)

- **Distribuição das Notas:** Frequência de cada nota de avaliação (1 a 5 estrelas).
- **Nota Média Geral:** Cálculo da média das avaliações.
- **Satisfação por Status de Pedido:** Nota média de avaliação para diferentes status de pedidos.
- **Impacto do Atraso:** Correlação entre pedidos atrasados e a nota média de avaliação do cliente.
- **Evolução Mensal das Avaliações:** Análise da nota média de avaliação ao longo do tempo.

## Principais Insights

- **Concentração de Clientes:** A maioria dos clientes está localizada em grandes centros urbanos, com São Paulo liderando em volume.
- **Eficiência de Entrega:** Uma alta porcentagem de pedidos é entregue no prazo, mas atrasos podem impactar negativamente a satisfação do cliente.
- **Preferência de Pagamento:** Cartões de crédito são o método de pagamento dominante, contribuindo significativamente para a receita total.
- **Tendências de Vendas:** O volume de pedidos e a receita podem apresentar sazonalidade ou crescimento constante ao longo dos meses.

## Como Rodar o Projeto

Para replicar este projeto localmente, siga os passos abaixo:

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/matheushlucio/olist-ecommerce-sql-analysis.git
    cd olist-ecommerce-sql-analysis
    ```
2.  **Configurar o PostgreSQL:**
    - Certifique-se de ter o PostgreSQL instalado e em execução.
    - Crie um novo banco de dados (ex: `ecommerce_olist`).
    - Importe o dataset da Olist para o seu banco de dados. Você pode encontrar o dataset original no Kaggle [1]. É necessário criar as tabelas e carregar os dados conforme o esquema do dataset.
3.  **Executar as Análises SQL:**
    - Navegue até a pasta `sql/`.
    - Abra cada arquivo `.sql` e execute as queries no seu ambiente PostgreSQL para obter os resultados das análises.

## Autor

**Matheus Henrique Lucio**

- [GitHub](https://github.com/matheushlucio)
- [LinkedIn](https://www.linkedin.com/in/matheushlucio/)

## Licença

Este projeto está licenciado sob a Licença MIT.

## Referências

[1] Olist. (n.d.). *Brazilian E-Commerce Public Dataset by Olist*. Kaggle. Disponível em: [https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
