class UsersController < ApplicationController
  inherit_resources

  layout 'user', :except => :index

  custom_actions :resource => [:profile, :tasks, :applies]

  def tasks
    if ['applied', 'assigned', 'completed', 'confirmed'].include?(params[:state])
      @tasks = resource.tasks.send(params[:state]).paginate(:page => params[:page], :per_page => 10)
    else
      @tasks = resource.tasks.alls.paginate(:page => params[:page], :per_page => 10)
    end
    @tasks = @tasks.order('updated_at desc')
  end

  def applies
    if ['applied', 'assigned', 'completed', 'confirmed'].include?(params[:state])
      @applies = resource.applies.send(params[:state]).paginate(:page => params[:page], :per_page => 10)
    else
      @applies = resource.applies.alls.paginate(:page => params[:page], :per_page => 10)
    end
    @applies = @applies.order('updated_at desc')
  end

  protected
  def collection
    @users ||= end_of_association_chain.paginate(:page => params[:page], :per_page => 10)
  end
end
