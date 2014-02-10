# encoding : utf-8
class TasksController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!, :except => [:index, :taxis]

  custom_actions :resource => [:cancel]

  [:cancel].each do |state|
    define_method state do
      resource.send(state)

      respond_to do |format|
        format.html { redirect_to :back, notice: "Task #{state}." }
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
    params[:task][:task_detail_attributes][:longitude] = params[:task][:task_detail_attributes][:longitude].to_f * 1000
    params[:task][:task_detail_attributes][:latitude] = params[:task][:task_detail_attributes][:latitude].to_f * 1000
    create!
  end

  protected
  def collection
    @tasks ||= end_of_association_chain.order('updated_at desc').where(:state => [:initial, :apply]).paginate(:page => params[:page], :per_page => 10)
  end
end
