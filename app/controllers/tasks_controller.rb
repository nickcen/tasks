class TasksController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!, :except => [:index]

  custom_actions :resource => [:cancel, :abandon]

  [:cancel, :abandon].each do |state|
    define_method state do
      resource.send(state)

      respond_to do |format|
        format.html { redirect_to task_path(resource), notice: 'Task Canceled.' }
        format.json { head :no_content }
      end
    end
  end

  def collection
    @tasks ||= end_of_association_chain.paginate(:page => params[:page], :per_page => 8)
  end
end
