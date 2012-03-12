# coding: utf-8

class OrderMailer < ActionMailer::Base
  helper :products

  default :from => 'anton@black-sheep.ru'

  def new_order(order)
    @order = order
    admin = User.all.first()
    mail(:to => admin.email, :subject => 'Поступил новый заказ')
  end
end
