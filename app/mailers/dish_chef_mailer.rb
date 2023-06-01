class DishChefMailer < ApplicationMailer
  def dish_email(dish, order)
    @dish = dish
    @chef_email = @dish.chef.user.email
    @chef_name = @dish.chef.user.name
    @order = order

    mail(to: @chef_email, subject: 'Novo pedido')
  end
end
