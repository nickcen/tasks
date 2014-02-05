class TasksController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!, :except => [:index]

  belongs_to :user, :polymorphic => true, :optional => true

  custom_actions :resource => [:cancel]

  [:applied, :assigned, :completed, :confirmed, :abandoned, :canceled].each do |state|
    has_scope state, :type => :boolean
  end

  respond_to :js, :only => :index

  [:cancel].each do |state|
    define_method state do
      resource.send(state)

      respond_to do |format|
        format.html { redirect_to task_path(resource), notice: "Task #{state}." }
        format.json { head :no_content }
      end
    end
  end

  def create
    @task = Task.new(:user => current_user)
    create!{task_path(@task)}
  end

  protected
  def collection
    @tasks ||= apply_scopes(end_of_association_chain).paginate(:page => params[:page], :per_page => 10)
  end
end
