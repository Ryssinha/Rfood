# frozen_string_literal: true

puts "iniciando seed"
filepath = ENV.fetch('FILEPATH', Rails.root.join('db/states_cities.json').to_s)
states = JSON.parse(File.read(filepath))

states.each do |state|
  state_obj = State.find_or_create_by!(acronym: state['acronym'], name: state['name'])

  state['cities'].each do |city|
    City.find_or_create_by!(name: city['name'], state: state_obj)
    Rails.logger.debug { "Adicionando a cidade #{city['name']} ao estado #{state_obj.name}" }
  end
end

admin_user = User.find_or_create_by!(email: 'admin+1@rarolabs.com.br', cpf: '52947611578') do |model|
  model.attributes = {
    name: 'Admin RaroFood',
    password: 'VW1234**'
  }
end
admin = Administrator.find_or_create_by!(user: admin_user)

user = User.find_or_create_by!(
  name: "Guilherme",
  cpf: "11111111111",
  email: "rarara@.com",
  password: "123456"
)

customer = Customer.find_or_create_by!(
  birthday: 7.days.ago,
  user: user
)

FactoryBot.create(:address)
FactoryBot.create(:category)
FactoryBot.create(:chef)
FactoryBot.create(:dish)
FactoryBot.create(:telephone)
FactoryBot.create(:order)
FactoryBot.create(:order_item)

card = Card.find_or_create_by!(
  customer: customer,
  number: "1111111111111111",
  name: "a11111111111",
  security_code: 123,
  card_type: 1,
  expiration_date: 30.days.from_now
)

coupon = Coupon.find_or_create_by!(
  code: "abcd",
  description: "1111111111111111",
  name: "a11111111111",
  start_date: 3.days.ago,
  end_date: 3.days.from_now,
  total_discount: 10.5,
  creator_id: admin.id
)

payment = Payment.find_or_create_by!(
  payment_type: 3,
  state: :paid,
  order: Order.first,
  card: Card.first
)

puts "finalizou seed"
