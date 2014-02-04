# encoding:utf-8


DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

1.upto(2).each do |i|
  u = FactoryGirl.create(:user, :user_type => i % 2)
  u.confirm!
end

1.upto(10).each do |i|
  FactoryGirl.create(:task, :user_id => 1 + i%2)
end

