# encoding=utf-8
module ApplyStateMachine
  extend ActiveSupport::Concern

  included do
    attr_accessible :state  

    after_create do 
      task.apply
    end

    state_machine :state, :initial => :applied do
      event :assign do
        transition :applied => :assigned
      end

      event :complete do
        transition :assigned => :completed
      end

      event :confirm do
        transition :completed => :confirmed
      end

      event :cancel do
        transition :applied => :canceled
      end

      event :abandon do
        transition :assigned => :abandoned
      end

      after_transition :applied => :assigned do |apply, transition|
        apply.task.assign
      end
    end
  end
end
