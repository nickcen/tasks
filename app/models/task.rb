class Task < ActiveRecord::Base
  include TaskStateMachine

  has_many :applies
  belongs_to :user
end
