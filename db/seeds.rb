# encoding:utf-8


DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

1.upto(10).each do |i|
  FactoryGirl.create(:task)
end

1.upto(4).each do |i|
  u = FactoryGirl.create(:user, :user_type => i % 2)
  u.confirm!
end