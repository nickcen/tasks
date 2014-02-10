class Task < ActiveRecord::Base
  include TaskStateMachine

  has_many :applies, :dependent => :destroy
  belongs_to :user

  has_one :task_detail, :dependent => :destroy
  accepts_nested_attributes_for :task_detail

  attr_accessible :user_id, :task_detail, :task_detail_attributes

  def applied?(user)
    !applies.where(:user_id => user).blank?
  end
end
