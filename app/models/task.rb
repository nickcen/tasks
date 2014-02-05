class Task < ActiveRecord::Base
  include TaskStateMachine

  has_many :applies
  belongs_to :user

  attr_accessible :user

  def applied?(user)
    !applies.where(:user_id => user).blank?
  end
end
