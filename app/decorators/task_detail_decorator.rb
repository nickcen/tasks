# encoding:utf-8

class TaskDetailDecorator < Draper::Decorator
  delegate_all

  def show_longitude
    object.longitude / 1000.0
  end

  def show_latitude
    object.latitude / 1000.0
  end

  def show_bonus
    object.bonus
  end

  def show_expect_time
    object.show_expect_time.strftime('%Y年%m月%d日')
  end
end
