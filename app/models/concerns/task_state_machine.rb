# encoding=utf-8
module TaskStateMachine
  extend ActiveSupport::Concern

  included do
    
  end

  def add_audit(user, operation, audit_date = Date.today)
    self.audits.create(:operation => operation, :user_id => user.id, :audit_date => audit_date)
  end
end
