class Apply < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  attr_accessible :task, :user, :state
  
end
