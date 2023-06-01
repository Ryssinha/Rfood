class SendEmailChefJob < ApplicationJob

  sidekiq_options retry: 5

  def perform(dish, order)
    DishChefMailer.dish_email(dish, order).deliver_now
  end
end

