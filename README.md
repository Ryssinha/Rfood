# raro-food

Projeto prático para aulas dos fundamentos de modelagem de banco de dados.

## setup

Antes de iniciar a aplicação, recomenda-se a execução da seguinte sequência de comandos:

```bash
rvm use 3.1.2
cd raro-food
bundle install
rails db:create
rails db:migrate
rails db:seed
```

Para iniciar o servidor, recomenda-se a utilização do comando `./bin/dev`, pois ele garante os assets serão todos devidamente processados.

#### Alguns comandos utilizados para nossa aplicação:

Verificar versão do ruby utilizada:

```bash
rvm use 3.1.2
```

Verificar versão do Yarn

```bash
yarn -v
```

Criando uma nova aplicação rails:

```bash
rails new raro_food -c=tailwind -d=mysql -j=esbuild
```

```bash
cd raro_food
bin/rails db:create db:migrate db:seed
```

### Adicionando Unit Test

Adicione o seguinte trecho no `Gemfile`:

```ruby
group :development, :test do
  # ....
  gem 'factory_bot_rails'
  gem 'faker'
end

group :test do
  # ...
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end
```

Execute os seguintes comandos:

```bash
bin/rails generate rspec:install
bin/rails db:migrate db:test:prepare
bin/rails generate rspec:model State
```

No arquivo gerado `rails_helper.rb`

```ruby
#...
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```

Crie um arquivo: `spec/support/factory_bot.rb` com o seguinte conteúdo:

```ruby
# frozen_string_literal: true

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
```

Ative o carregamento automático do diretório de support descomentando a seguinte linha em seu `spec/rails_helper.rb`:

```ruby
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
```

### Adicionar Coverage para Testes

Adicione o seguinte trecho no `Gemfile` e execute o `bundle install`:

```ruby
group :test do
  # ...
  gem 'simplecov', require: false
end
```

No início do arquivo `spec_helper.rb` acrescentar o seguinte trecho:

```ruby
# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

# ...
```

### Adicionando Rubocop

No arquivo `Gemfile`:

```ruby
group :development do
  # ...
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
```

Na raiz do projeto crie um arquivo `.rubocop.yml` com o seguinte conteúdo:

```yaml
require:
  - rubocop-rails
  - rubocop-rspec

AllCops:
  NewCops: enable
  TargetRubyVersion: 3.1.2
```

Ao executar o comando abaixo no terminal, serão listados os erros encontrados:

```bash
rubocop
```

Para corrigí-los, pode ser executado o comando:

```bash
rubocop -A
```

# Documentação das tomadas de decição


## Modificações realizadas na aplicação:

Realizei a migração do banco de dados para o PostgreSQL.
### **Sequência de modificações:**

 1- Criei as seguintes rotas com base nas atividades solicitadas para cada modelo:
Modelo Chef:

```
/chefs
/chefs/:id
/chefs/:chef_id/address
/chefs/:chef_id/city
/chefs/:chef_id/state
/chefs/:chef_id/telephones
/chefs/:chef_id/dishes
Modelo Coupon:

/coupons
/coupons/:id
/coupons/:coupon_id/orders
Modelo Customer:

/customers
/customers/:id
/customers/:customer_id/orders
/customers/:customer_id/addresses/:id
/customers/:customer_id/telephones
/customers/:customer_id/cards/:id
Modelo Dish:

/dishes
/dishes/:id
/dishes/:dish_id/categories
Modelo Order:

/orders
/orders/:id
/orders/:order_id/order_items
/orders/:order_id/order_items/:id
/orders/:order_id/dishes
/orders/:order_id/dishes/:id
/orders/:order_id/city
/orders/:order_id/payment
Modelo Payment:

/payments
/payments/:id
/payments/:payment_id/customer
Modelo State:

/states
/states/:id
/states/:state_id/cities
```

2 - Criei os controladores coupon, customer, dishes, orders, payments, states, cities, addresses, telephones, cards, categories e order_items, nessa sequência. Foi implementado apenas o método index e show em cada um deles.

3 - Realizei a população do banco de dados por meio do arquivo de sementes (seed) para permitir a realização de testes futuros.

4 - Durante a execução dos testes, identificou-se a necessidade de implementar mais funcionalidades no método show e realizar ajustes em algumas rotas que estavam incorretas. Além disso, foram removidos métodos show desnecessários.

## Exemplo para testar as rotas usando o aplicativo Insomnia:
- **Modelo Chef:**

/chefs = **`localhost:3000/chefs`**

/chefs/:id = **`localhost:3000/chefs/1`**

/chefs/:chef_id/address = **`localhost:3000/chefs/1/address`**

/chefs/:chef_id/city = **`localhost:3000/chefs/2/city`**

/chefs/:chef_id/state = **`localhost:3000/chefs/1/state`**

/chefs/:chef_id/telephones = **`localhost:3000/chefs/1/telephones`**

/chefs/:chef_id/dishes = **`localhost:3000/chefs/1/dishes`**

- **Modelo Coupon:*

/coupons = **`localhost:3000/coupons`*

/coupons/:id = **`localhost:3000/coupons/1`**

/coupons/:coupon_id/orders = **`localhost:3000/coupons/1/orders`**

- **Modelo Customer:**

/customers = **`localhost:3000/customers`**

/customers/:id = **`localhost:3000/customers/1`**

/customers/:customer_id/orders = **`localhost:3000/customers/1/orders`**

/customers/:customer_id/addresses/:id = **`localhost:3000/customers/1/addresses/1`**

/customers/:customer_id/telephones = **`localhost:3000/customers/1/telephones`**

/customers/:customer_id/cards/:id = **`localhost:3000/customers/1/cards/1`**

- **Modelo Dish:**

/dishes = **`localhost:3000/dishes`**

/dishes/:id = **`localhost:3000/dishes/1`**

/dishes/:dish_id/categories = **`localhost:3000/dishes/1/categories`**

- **Modelo Order:**

/orders = **`localhost:3000/orders`**

/orders/:id = **`localhost:3000/orders/1`**

/orders/:order_id/order_items = **`localhost:3000/orders/1/order_items/`**

/orders/:order_id/order_items/:id = **`localhost:3000/orders/1/order_items/1`**

/orders/:order_id/dishes = **`localhost:3000/orders/1/dishes`**

/orders/:order_id/dishes/:id = **`localhost:3000/orders/1/dishes/1`**

/orders/:order_id/city = **`localhost:3000/orders/1/city`**

/orders/:order_id/payment = **`localhost:3000/orders/1/payment`**

- **Modelo Payment:**

/payments = **`localhost:3000/payments`**

/payments/:id = **`localhost:3000/payments/1`**

/payments/:payment_id/customer = **`localhost:3000/payments/1/customer`**

- **Modelo State:**

/states = **`localhost:3000/states`**

/states/:id = **`localhost:3000/states/1`**

/states/:state_id/cities = **`localhost:3000/states/1/cities`**

