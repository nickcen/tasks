class TasksController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!, :except => [:index, :taxis]

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

  def new
    @task = Task.new
    @task.task_detail = TaskDetail.new
  end

  def create
    params[:task][:user_id] = current_user.id
    create!
  end

  protected
  def collection
    @tasks ||= end_of_association_chain.where(:state => [:initial, :apply]).paginate(:page => params[:page], :per_page => 10)
  end
end
