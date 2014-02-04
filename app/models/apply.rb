class Apply < ActiveRecord::Base
  include ApplyStateMachine
  belongs_to :task
  belongs_to :user

  attr_accessible :task, :user
end
