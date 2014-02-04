class AppliesController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!

  belongs_to :task, :polymorphic => true, :optional => true

  custom_actions :resource => [:assign, :cancel, :abandon]

  def create
    @apply = Apply.new(:task => parent, :user => current_user)
    create!{task_path(parent)}
  end

  def assign
    resource.assign

    respond_to do |format|
      format.html { redirect_to task_path(resource.task), notice: 'User Assigned.' }
      format.json { head :no_content }
    end
  end

  def cancel
    resource.cancel

    respond_to do |format|
      format.html { redirect_to task_path(resource.task), notice: 'Apply Canceled.' }
      format.json { head :no_content }
    end
  end

  def abandon
    resource.abandon

    respond_to do |format|
      format.html { redirect_to task_path(resource.task), notice: 'Apply Abandoned.' }
      format.json { head :no_content }
    end
  end
end