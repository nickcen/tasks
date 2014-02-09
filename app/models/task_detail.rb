class TaskDetail < ActiveRecord::Base
  belongs_to :task

  attr_accessible :bonus, :longitude, :latitude, :expect_time, :location
end
