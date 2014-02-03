class Task < ActiveRecord::Base
  attr_accessible :name, :pitch, :state
end
