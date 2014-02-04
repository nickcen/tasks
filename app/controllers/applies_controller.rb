class AppliesController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!

  belongs_to :task, :polymorphic => true, :optional => true

  custom_actions :resource => :assign

  def create
    @apply = Apply.new(:task => parent, :user => current_user)
    create!{task_path(parent)}
  end

  def assign
    ap resource
    @apply.assign

    respond_to do |format|
      format.html { redirect_to task_path(resource.task), notice: 'User Assigned.' }
      format.json { head :no_content }
    end
  end
end