class UsersController < ApplicationController
  inherit_resources

  layout 'user', :except => :index

  custom_actions :resource => [:profile, :tasks, :applies]

  def tasks
    if ['applied', 'assigned', 'completed', 'confirmed'].include?(params[:state])
      @tasks = resource.tasks.send(params[:state]).paginate(:page => params[:page], :per_page => 10)
    else
      @tasks = resource.tasks.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def applies
    if ['applied', 'assigned', 'completed', 'confirmed'].include?(params[:state])
      @applies = resource.applies.send(params[:state]).paginate(:page => params[:page], :per_page => 10)
    else
      @applies = resource.applies.paginate(:page => params[:page], :per_page => 10)
    end
  end

  protected
  def collection
    @users ||= end_of_association_chain.paginate(:page => params[:page], :per_page => 10)
  end
end
