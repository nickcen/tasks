# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task_detail do
    bonus {[5,10,15].sample}
    longitude {rand(10000)}
    latitude {rand(10000)}
    expect_time {Time.now}
    location 'some place'
  end
end
