# encoding:utf-8
class ApplyDecorator < Draper::Decorator
  delegate_all

  decorates_association :user
  decorates_association :task

  def show_apply_date
    object.created_at.strftime('%Y年%m月%d日')
  end

  def show_state
    object.human_state_name
  end
end
