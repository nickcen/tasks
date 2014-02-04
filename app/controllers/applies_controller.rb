class AppliesController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!

  belongs_to :task, :polymorphic => true

  def create
    @apply = Apply.new(:task => parent, :user => current_user)
    create!
  end
end