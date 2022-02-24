# Aplicativo de Demonstração

## Criando o Projeto

> rails new project_name

Para ter mais opções digite:

> rails new -h

Uma possibilidade seria:

> rails new project_name --database=postgresql  --skip-test

Skip test quando se quer utilizar uma ferramenta de testes sem um scaffold.

## Iniciando o banco de dados

> rake db:create:all

> rake db:migrate

## Iniciando o servidor de desenvolvimento

> rails s

ou

> rails server

Para mais opções, digite:

> rails server -h

## Comandos do Rake

> db:create

Cria o database para o enviroment corrente (o rails possui três: development, test e production).

> db:create:all

Cria o database em todos os enviroments.

> db:drop

Dá um drop do database do enviroment corrente.

> db:drop:all

Dá drop em todos os enviroments: development, test e production.

> db:migrate

Aplica a migração que ainda não foi aplicada no enviroment corrente.

> db:migrate:up

Aplica uma migração específica.

> db:migrate:down

Dá um roll back.

> db:migrate:status

Exibi a situação dos migrates atuais.

> db:rollback

Desfaz a última migração.

> db:foward

Avança o schema atual para o próximo schema.

> db:seed

Aplica o arquivo db/seeds.rb

> db:schema:load

Aplica/carrega o schema no enviroment corrente.

> db:schema:dump

Dá um dump no schema do enviroment corrente - e parece criar o database também.

> db:setup

Roda o db:schema:load e o db:seed.

> db:reset

Roda o db:drop e o db:setup

> db:migrate:redo

Roda (db:migrate:down e db:migrate:up) ou (db:rollback e db:migrate:migrate) dependendo da migração específica.

> db:migrate:reset

Roda db:drop, db:create e db:migrate.


## Utilizando o scaffold do Rails para criar um CRUD

> rails generate scaffold Nome atributo1:string atributo2:text atributo3:decimal

> rake db:migration

> rails server

Acessar localhost:3000/nomenoplural


## Para abrir o console do Rails

> rails console