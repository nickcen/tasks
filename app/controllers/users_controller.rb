class UsersController < ApplicationController
  inherit_resources

  protected
  def collection
    @users ||= end_of_association_chain.paginate(:page => params[:page], :per_page => 10)
  end
end
