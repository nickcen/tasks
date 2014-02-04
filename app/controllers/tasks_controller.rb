class TasksController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!, :only => :complete

  custom_actions :resource => :complete

  def complete
    resource.complete

    respond_to do |format|
      format.html { redirect_to task_path(resource), notice: 'Task Complete.' }
      format.json { head :no_content }
    end
  end
end
