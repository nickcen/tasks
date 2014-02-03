# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence(:user_name) {|n| "user_#{n}" }

  factory :user do
    name {generate(:user_name)}
    email { "#{name}@taks.com".downcase }
    password "123456"
  end
end
