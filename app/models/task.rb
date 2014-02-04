class Task < ActiveRecord::Base
  attr_accessible :state

  has_many :applies
  belongs_to :user
end
