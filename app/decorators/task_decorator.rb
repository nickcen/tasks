# encoding:utf-8
class TaskDecorator < Draper::Decorator
  delegate_all

  decorates_association :user

  def show_name
    "Task #{object.id}"
  end

  def show_state
    object.human_state_name
  end

  def show_apply_count
    object.applies.count
  end

  def apply_link
    h.link_to 'Apply', h.new_task_apply_path(object), :class => 'btn btn-primary btn-sm' if h.can?(:apply, object)
  end

  def cancel_link
    h.link_to 'Canel', h.cancel_task_path(object), :class => 'btn btn-danger btn-sm' if h.can?(:cancel, object)
  end

  def edit_link
    h.link_to 'Edit', h.edit_task_path(object), :class => 'btn btn-info btn-sm' if h.can?(:edit, object)
  end
end
