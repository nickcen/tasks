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

  def assign_link
    h.link_to 'Assign', h.assign_apply_path(object), :class => 'btn btn-primary btn-sm', :method => :post if h.can?(:assign, object)
  end

  def confirm_link
    h.link_to 'Confirm', h.confirm_apply_path(object), :class => 'btn btn-primary btn-sm', :method => :post if h.can?(:confirm, object)
  end

  def complete_link
    h.link_to 'Complete', h.complete_apply_path(object), :class => 'btn btn-primary btn-sm', :method => :post if h.can?(:complete, object)
  end

  def cancel_link
    h.link_to 'Canel', h.cancel_apply_path(object), :class => 'btn btn-danger btn-sm', :method => :post if h.can?(:cancel, object)
  end

  def abandon_link
    h.link_to 'Abandon', h.abandon_apply_path(object), :class => 'btn btn-danger btn-sm', :method => :post if h.can?(:abandon, object)
  end
end
