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

Para iniciar o servidor, recomenda-se a utilização dos seguintes comandos:

```bash
mailcatcher
redis-server & bundle exec sidekiq -C config/sidekiq.yml
bundle exec sidekiq -q default -q dishes
redis-server
rails s
```

Verificar versão do Yarn

```bash
yarn -v
```

- Banco de dados: PostgreSQL


# Documentação das tomadas de decição

## Configuração do Sidekiq com Redis
O Sidekiq, em conjunto com o Redis, foi configurado para permitir o processamento assíncrono de tarefas. O Sidekiq é responsável por enfileirar e executar os jobs de forma eficiente, melhorando a escalabilidade do sistema.

## Configuração do Mailcatcher
O Mailcatcher foi configurado para facilitar o controle de e-mails durante o desenvolvimento. Com essa configuração, é possível visualizar os e-mails enviados pelo sistema em um ambiente local, facilitando o processo de teste e depuração.

## Envio de E-mails Assíncronos para Chefes
Foi implementado o envio de e-mails assíncronos para chefes sempre que um novo prato é adicionado a um pedido. Esses e-mails contêm informações relevantes, como o código do pedido, nome e e-mail do cliente, nome, descrição e preço unitário do prato. Além disso, são fornecidos dois links: um para acessar o pedido e outro para visualizar o prato solicitado. Para garantir que os e-mails sejam enviados imediatamente, um job chamado "SendEmailChefJob".

## Atualização Automática de Preços de Pedidos
Quando o preço unitário de um prato é atualizado, é necessário atualizar também o preço unitário dos itens dos pedidos que referenciam esse prato, bem como o preço total do pedido. Para isso, foi implementado um Job chamado "UpdatePriceJob". Esse Job é enfileirado na queue "dishes" e realiza as atualizações apenas para os pedidos que estejam com o status "Iniciado" (started).

## Upload de Fotos e Console de Ferramentas de Estilização do Texto
Foi implementado o upload de fotos dos pratos, utilizando os recursos do Action Text e Active Storage do Rails. Além disso, um console de ferramentas para estilização do texto (WYSIWYG) foi disponibilizado, melhorando a experiência de edição das descrições dos pratos. Para suportar o processamento das imagens, a gem "image_processing" foi adicionada e as devidas migrations e configurações foram executadas.

## Estilização das Views
Foram realizadas melhorias na qualidade visual das views, buscando proporcionar uma experiência aprimorada para os usuários do sistema. As views foram estilizadas de forma agradável e intuitiva, proporcionando uma melhor usabilidade e interação com o Raro Food.


