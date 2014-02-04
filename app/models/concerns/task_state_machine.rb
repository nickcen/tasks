# encoding=utf-8
module TaskStateMachine
  extend ActiveSupport::Concern

  included do
    attr_accessible :state  

    state_machine :state, :initial => :initial do
      def initialize
        super
      end

      event :apply do
        transition [:initial, :applied] => :applied
      end

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
        transition [:initial, :applied] => :canceled
      end

      event :abandon do
        transition :assigned => :abandoned
      end
    end
  end
end
