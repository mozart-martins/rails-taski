# Aplicativo de Demonstração


## Criando o Projeto

> rails new project_name

Para ter mais opções digite:

> rails new -h

Uma possibilidade seria:

> rails new project_name --database=postgresql  --skip-test

Skip test quando se quer utilizar uma ferramenta de testes sem um scaffold.
**O nome do projeto criado nesses arquivos é Project.**


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

Neste modo, as modificações serão permanentes.

> rails console --sandbox

Já neste, quando sairmos do console, mas modificações serão desfeitas.


## Criando 10 registros de "Project"

> 10.times do |project|
>   Project.create!(title: "Projeto número #{project}.", description: "My cool description")
> end


## Trazendo todos os projects cadastrados

> Project.all


## Contando a quantidade de registros

> Project.count


## Obtendo o último projeto e manipulando-o

> Project.last

Para atualizar:

> Project.last.update!(title: "Meu último projeto")

Para excluir:

> Project.last.delete


## Selecionando Projetos

> Project.find(5)

Onde 5 é o ID do registro obtido com o comando Project.all.

> Project.find([1, 3, 5])

Vai trazer os registros cujos os ids são 1, 3 e 5 em forma de array.

> Project.where(title: "Projeto numero 2")

Essa é a busca exata por texto.

> Project.where.not(title: "Projeto numero 2")

Busca por todos diferentes de 2.

> description = Project.arel_table[:description]
> key_words = "qualquer coisa..."
> Project.where(description.matches("%#{key_words}%"))

Essa é um busca utilizando o comando SQL LIKE.  


## Manipulando a propriedade de um registro

> Project.find(1).description.upcase


## Exibindo todas as rotas da aplicação

> rails routes


## Criando controllers

> rails generate controller Pages contact about home

Esse comando gera um PagesController (controller) com as rotas e métodos 
(no controller) contact, about e home.


## Criando uma rota personalizada

Uma rota padrão tem o seguinte formado: **get 'pages/contact'**. Ela vai direcionar
para o arquivo app/views/pages/contact.html.erb. 

No entanto, se quisermos modificar a rota, podemos mudar da para o seguinte 
formato: **get "contact", to: "pages#contact"**. Isso significa que quando for digitado
o url do contact no browser, essa requisição deverá ser direcionado para o pages 
controller no seu método contact, que, por padrão, vai procurar o 
**app/views/pages/contact.html.erb**.


## Passando parâmetros para uma view

Dentro de um controler, pode-se dentro algum de seus métodos definir uma variável de
instância e acessá-la no arquivo erb.

Exemplo, no controller Pages, temos um método **contact** que irá procurar, como dito antes,
o **app/views/pages/contact.html.irb**.

> def contact
>   @title = "Meu título legal"
> end

Para acessar na view, basta:

> <h1><%= @title %></h1>


## Definindo a páginas home/index

> root 'pages#home'

Pages é o controller e home um de seus métodos.


## Laço de repetição com array de registros passado via controller

Controller:

> def home
>   @projects = Project.all.limit(10)
> end

Na view:

> <% projects.each do |project| %>
> <p> <%= project.title  %> </p>
> <% end %>


## Utilizando redirect para sites externos via rotas

> get "blog", to: redirect("http://www.google.com")

Quando for digitado /blog, será redirecionado para o site do Google.

Na última rota, é uma boa prática adicionar uma genérica.

> get "error", to: "pages#error"
> get "*path", to: redirect("error")

Que irá procurar no controller Pages o método error, que se não tiver
conteúdo, está na convenção de procurar a view **error.html.erb**.

A página de erro pode conter um link para o home utilizando uma ferramenta
do Rails. Dentro do **error.html.erb** pode haver uma linha como:

Para voltar, clique em **<%= link_to "homepage", root_path %>**, onde **home page**
é o texto que será exibido em forma de link e **root_path** a rota root.