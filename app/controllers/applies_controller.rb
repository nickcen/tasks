class AppliesController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!

  belongs_to :task, :polymorphic => true, :optional => true

  custom_actions :resource => [:assign, :cancel, :abandon, :complete, :confirm]

  def create
    @apply = Apply.new(:task => parent, :user => current_user)
    create!{task_path(parent)}
  end

  [:assign, :cancel, :abandon, :complete, :confirm].each do |state|
    define_method state do
      resource.send(state)

      respond_to do |format|
        format.html { redirect_to task_path(resource.task), notice: 'User Assigned.' }
        format.json { head :no_content }
      end
    end
  end
end