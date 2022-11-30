Projeto de Transformação de Dados da Adventure Works

### Inicialização do Projeto

Primeiro instalar o dbt utilizando os comandos:
- pip install dbt-core
- pip install dbt-bigquery (sendo este último pelo big query ter sido escolhido como data warehouse)

Após realizar a instalação, é necessário colocar as credencias do projeto. Aqui, como o big query foi o data warehouse escolhido, colocar as credenciais solicitadas encontradas no google cloud plataform. 

Com o projeto configurado, inicializa-se o git através do comando git init. Assim, toda a documentação de código estará salvo no repositório.


### Divisão dos modelos
Dentro do projeto dbt existem pastas com objetivos diferente, neste projeto foram utilizadas as pastas models e tests. Dentro da pasta models, existem outras duas pastas (marts e staging). 

1) staging:
Na pasta staging têm-se a primeira transformação dos dados. Onde realiza-se as transformações dos dados e eliminação de colunas desnecessárias. Encontra-se também o modelo sources.yml feito para documentar as tabelas e realizar testes de validação. 

2) marts:
Na pasta marts encontra-se as tabelas dimensões e fatos. Nesta tabela são realizados os joins entre as tabelas necessárias para fazer as dimensões e as dimensões são responsáveis pela criação da tabela fato. 

Cada uma das tabelas são feitas através de comandos sql e com o comando dbt run, são enviadas para o data warehouse previamente configurado. 

3) tests: 
Dentro deste arquivo estão realizados os testes de dados, que estão em formato sql e ditam a validação do modelo. 

### Documentação do Projeto
Com o projeto finalizado podemos verificar sua documentação e acessar o servidor que mostra também as dependências entre as tabelas. 
- Primeiro para gerar o documento é utilizado o comando: dbt docs generate
- Após isso, basta utilizar o comando dbt serve que será aberto um site com toda a documentação do projeto. 