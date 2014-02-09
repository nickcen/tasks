class TaxiTasksController < ApplicationController
  inherit_resources
  
  # # GET /taxi_tasks/1
  # # GET /taxi_tasks/1.json
  # def show
  #   @taxi_task = TaxiTask.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @taxi_task }
  #   end
  # end

  # # GET /taxi_tasks/new
  # # GET /taxi_tasks/new.json
  # def new
  #   @taxi_task = TaxiTask.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @taxi_task }
  #   end
  # end

  # # GET /taxi_tasks/1/edit
  # def edit
  #   @taxi_task = TaxiTask.find(params[:id])
  # end

  # # POST /taxi_tasks
  # # POST /taxi_tasks.json
  # def create
  #   @taxi_task = TaxiTask.new(params[:taxi_task])

  #   respond_to do |format|
  #     if @taxi_task.save
  #       format.html { redirect_to @taxi_task, notice: 'Taxi task was successfully created.' }
  #       format.json { render json: @taxi_task, status: :created, location: @taxi_task }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @taxi_task.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PUT /taxi_tasks/1
  # # PUT /taxi_tasks/1.json
  # def update
  #   @taxi_task = TaxiTask.find(params[:id])

  #   respond_to do |format|
  #     if @taxi_task.update_attributes(params[:taxi_task])
  #       format.html { redirect_to @taxi_task, notice: 'Taxi task was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @taxi_task.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /taxi_tasks/1
  # # DELETE /taxi_tasks/1.json
  # def destroy
  #   @taxi_task = TaxiTask.find(params[:id])
  #   @taxi_task.destroy

  #   respond_to do |format|
  #     format.html { redirect_to taxi_tasks_url }
  #     format.json { head :no_content }
  #   end
  # end

  protected
  def collection
    @taxi_tasks ||= apply_scopes(end_of_association_chain).paginate(:page => params[:page], :per_page => 9)
  end
end
