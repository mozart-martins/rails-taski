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


## Criando links para rotas

Em um erb, basta adicinar algo no formato **<%= link_to "texto_visivel", rota_path>**.
Exemplos utilizando as rotas blog contact e blog.

> <%= link_to "Contact", contact_path %>
> <%= link_to "Blog", blog_path %>


## Usando partials ou importanto arquivos html / erb (embedded ruby) em outro html / erb.

Em primeiro lugar, um arquivo que será importando, que é chamado de partial, deve
comecar o seu nome com _. Esse underscore é uma convenção.

Por exemplo, criando o arquivo partial **_nav.html.erb** em **views/shared**, para
importar em **application.html.erb** basta utilizar:

> <%= render "shared/nav" %>


## Comentando embedded ruby

> <%#= 4 + 4 %>


## Para imprimir tudo de um object

> <%= nome_do_objeto.inspect %>


## Interpolação de strings em arquivo erb (ruby embedded)

> <%= "- #{project.title}" if project.title != nil %>

ou

> <%= "- #{project.title}" if project.title %>


## Adicionando uma imagem em um erb

> <%= image_tag("logos/Lays-Logo.png") %>

Onde o arquivo png fica em **app/assets/logos/Lays-Logo.png**.
É possível passar alguns parâmetros como o width:

> <%= image_tag("logos/Lays-Logo.png", width: '150px') %>


## Adicionando um arquivo css ao projeto

Para adicionar um arquivo CSS ao projeto, basta adicionar um arquivo .css
ao diretório **app/assets/arquivo.css** que ele será renderizado.

## Utilizando fontes seguras (web safe fonts)

Basta pesquisar no google por "web safe fonts" e adicionar na font-family
do arquivo .css.

Web safe fonts são fontes que funcionam em qualquer browser.


## Utilizando fontes personalisadas / customizadas

Um site legal para se buscar é o **dafont.com**. Basta fazer download da
fonte e criar um diretórios fonts em assets, descomprimindo a fonte
no diretório.

Posteriormente, acessar o arquivo **config/initializers/assets.rb**  e adicionar
as seguintes linhas dentro da class **Application**.

> Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

Isso é necessário porque não é padrão do Rails buscar por fontes, então estamos
adicionando aos **paths** o diretório. 

Depois disto, no arquivo **.css**, deve-se importar a fonte:

> @font-face {
>   font-family: "die nasty";
>   src: url("/assets/die nasty.otf")
> }

Posteriormente, para utiliza-la no mesmo arquivo css:

> .homepage-projects h4 {
>     font-family: "Die Nasty";
>     font-size: 3em;
> }

Lembre-se de utilizar o nome da fonte no font-family.
**REINICIE O SERVIDOR PARA CARREGAR A FONTE.**


## Inserindo métodos e propriedades em todos os controllers simultaneamente

Adicionando propriedades e métodos no arquivo application_controller.rb,
todos os outros controllers terão acesso, haja vista todos os controllers
herdarem desta classe.


## Modificando os parâmetros que um controller recebe

Um controller recebe apenas os parâmetros permitidos no método privado
project_params.

Então, quando se adicionar um novo campo em um model, deve-se adicioná-lo
nesse método também.


## Criando um método de escopo personalizado (custom scope) no model

Basta criar, dentro do model - ApplicationRecord, uma função no seguinte 
formado - percent_complete é um campo:

> scope :almost_completed, -> { where('percent_complete > 0.75') }

Posteriormente, basta modificar um método do controller de:

> def index
>   @projects = Project.all
> end

Para:

> def index
>   @projects = Project.almost_complete
> end

Assim, serão exibidos somente os registros cujo campo percent_complete seja 
maior que 75%.


## Construindo um callback (trigger) no model

Dentro de um model (ApplicationRecord), basta:

> after_initialize :set_defaults

> def set_defaults
>   self.percent_complete ||= 0.0
> end

No entando, quando testei com o método create no console, **o callback não
foi acionado**. Existem outros callbacks na documentação do Rails.


## Integrando validações aos models

Um exemplo de validação é a verificação da existência de conteúdo no campo tittle. 
Dentro do models (ApplicationRecord).

> validates_presence_of :title

No entando, quando testei com o método create no console, **a validação não
foi acionada**. Existem outras validações na documentação do Rails.


## Criando um model via console e criando chaves extrangeiras

> rails generate model Task title:string description:text project:references

Esse comando cria o migrate e o model (ApplicationRecord), sendo project uma
chave estrangeira. Esse comando irá criar um migration, uma classe, posteriormente,
um schema como os a seguir:

A classe model. Uma task vai ter uma chave extrangeira de project.

> class Task < ApplicationRecord
>   belongs_to :project
> end

Do outro lado, temos que um projeto pode ter várias tasks.

> class Project < ApplicationRecord
>     has_may :task
> end


## Adicionando um campo ao schema por meio de migrations no console

> rails generate migration add_completed_to_tasks completed:boolean

Esse comando cria a migration:

> class AddCompletedToTasks < ActiveRecord::Migration[7.0]
>   def change
>     add_column :tasks, :completed, :boolean
>   end
> end

Após add_column, o primeiro label é o schema, o segundo é o campo e o
terceiro o tipo. Para aplicar, basta:

> rake db:migrate

Isso afetara o schema do task e, consequentemente o banco.


## Criando uma trigger depois de salvar um registro

> class Task < ApplicationRecord
>   belongs_to :project
>   after_save :update_percent_complete if :mark_completed? == true
>   scope :completed, -> { where(completed: true) }
>  def mark_completed?
>    self.completed == true
>  end
>  def update_percent_complete
>    project = Project.find(self.project_id)
>    count_of_completed_task = project.task.completed.count
>    count_of_total_task = project.task.count
>    project.update!(percent_complete: Counter.calculate_percentege_complete(
>      count_of_completed_task, count_of_total_task))
>  end
> end

Observe a linha **after_save** que indica que se a propriedade completed do registro
estiver marcada como true, o método **update_percent_complete** será chamada para
atualizar outra tabela.

Considere também que a classe Counter foi criada no diretório models e possui o
método **calculate_percentage_complete**. Como se segue:

> class Counter
>     def self.calculate_percentege_complete(completed_task, total)
>         return completed_task.to_f / total.to_f * 100
>     end
> end