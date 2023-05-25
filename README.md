# Raro Food

## Visão Geral

O Raro Food é um projeto acadêmico desenvolvido com o objetivo de aprimorar as habilidades na criação de views e routes utilizando a linguagem Ruby on Rails. A aplicação visa proporcionar um ambiente de aprendizado prático para desenvolvedores interessados em aprofundar seus conhecimentos nessa tecnologia.

## Configuração do Ambiente

Antes de iniciar a aplicação, recomenda-se a execução da seguinte sequência de comandos:

```bash
rvm use 3.1.2
cd raro-food
bundle install
rails db:create
rails db:migrate
rails db:seed
bin/rails generate rspec:install
bin/rails db:migrate db:test:prepare
```

Para iniciar o servidor, recomenda-se a utilização do comando `./bin/dev`, pois ele garante os assets serão todos devidamente processados.


Verificar versão do Yarn

```bash
yarn -v
```


- Banco de dados: PostgreSQL




# Documentação das tomadas de decição

## Rotas

As rotas da aplicação foram configuradas seguindo as melhores práticas do framework Ruby on Rails. Veja abaixo a lista de rotas disponíveis:

- Rota raiz (home): `root "home#index"`
- Autenticação de usuários utilizando Devise: `devise_for :users`
- CRUDs das entidades:
  - Chefs: `resources :chefs`
  - Customers: `resources :customers`
  - Dishes: `resources :dishes`
  - Categories: `resources :categories`
  - Orders: `resources :orders`
  - Order Items: `resources :order_items`

## Autenticação de Usuários

A autenticação de usuários foi implementada utilizando a gem Devise, uma poderosa solução para autenticação de usuários em aplicações Rails. Com o Devise, é possível realizar o gerenciamento de usuários, permitindo que eles façam login, se registrem e interajam com a aplicação de acordo com suas permissões.

## Views e Estilização

Foram criadas views para cada uma das entidades mencionadas acima, seguindo os métodos do CRUD (Create, Read, Update, Delete). As views foram projetadas e estilizadas de forma a proporcionar uma experiência agradável para os usuários. O layout e a aparência das páginas seguem as diretrizes fornecidas pelo professor, mantendo a consistência visual em toda a aplicação.

## Internacionalização

Visando uma melhor experiência para os usuários, todas as palavras e termos presentes na aplicação foram adaptados para o idioma português. Isso proporciona uma maior familiaridade e facilita a compreensão das funcionalidades e recursos disponíveis.



