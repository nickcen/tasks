# encoding:utf-8
class TaskDecorator < Draper::Decorator
  delegate_all

  def show_name
    "Task #{object.id}"
  end

  def show_state
    object.human_state_name
  end

  def show_apply_count
    object.applies.count
  end
end
