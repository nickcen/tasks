# encoding:utf-8


DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

u1 = FactoryGirl.create(:user)
u1.confirm!

u2 = FactoryGirl.create(:user)
u2.confirm!

u3 = FactoryGirl.create(:user)
u3.confirm!


p "----- Task -----"
p "applied"
task = FactoryGirl.create(:task, :user_id => 1)
apply_1 = FactoryGirl.create(:apply, :task => task, :user => u2)
apply_2 = FactoryGirl.create(:apply, :task => task, :user => u3)

p "assigned"
task = FactoryGirl.create(:task, :user_id => 1)
apply_1 = FactoryGirl.create(:apply, :task => task, :user => u2)
apply_2 = FactoryGirl.create(:apply, :task => task, :user => u3)

apply_1.assign

p "completed"
task = FactoryGirl.create(:task, :user_id => 1)
apply_1 = FactoryGirl.create(:apply, :task => task, :user => u2)
apply_2 = FactoryGirl.create(:apply, :task => task, :user => u3)

apply_1.assign
apply_1.complete

p "confirmed"
task = FactoryGirl.create(:task, :user_id => 1)
apply_1 = FactoryGirl.create(:apply, :task => task, :user => u2)
apply_2 = FactoryGirl.create(:apply, :task => task, :user => u3)

apply_1.assign
apply_1.complete
apply_1.confirm

p "canceled"
task = FactoryGirl.create(:task, :user_id => 1)
apply_1 = FactoryGirl.create(:apply, :task => task, :user => u2)
apply_2 = FactoryGirl.create(:apply, :task => task, :user => u3)

task.cancel

p "----- Apply -----"
p "canceled"
task = FactoryGirl.create(:task, :user_id => 1)
apply_1 = FactoryGirl.create(:apply, :task => task, :user => u2)
apply_2 = FactoryGirl.create(:apply, :task => task, :user => u3)

apply_1.cancel

p "abandoned"
task = FactoryGirl.create(:task, :user_id => 1)
apply_1 = FactoryGirl.create(:apply, :task => task, :user => u2)
apply_2 = FactoryGirl.create(:apply, :task => task, :user => u3)

apply_1.assign
apply_1.abandon