# encoding:utf-8
class UserDecorator < Draper::Decorator
  delegate_all

  def show_name
    user.name
  end
end
