class TasksController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!, :except => [:index]

  custom_actions :resource => [:cancel]

  [:cancel].each do |state|
    define_method state do
      resource.send(state)

      respond_to do |format|
        format.html { redirect_to task_path(resource), notice: "Task #{state}." }
        format.json { head :no_content }
      end
    end
  end

  protected
  def collection
    @tasks ||= end_of_association_chain.paginate(:page => params[:page], :per_page => 10)
  end
end
