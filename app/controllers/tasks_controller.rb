class TasksController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!, :except => [:index]

  custom_actions :resource => [:complete, :confirm]

  def complete
    resource.complete

    respond_to do |format|
      format.html { redirect_to task_path(resource), notice: 'Task Complete.' }
      format.json { head :no_content }
    end
  end

  def confirm
    resource.confirm

    respond_to do |format|
      format.html { redirect_to task_path(resource), notice: 'Task Complete.' }
      format.json { head :no_content }
    end
  end
end
