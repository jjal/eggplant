class LeavesController < ApplicationController
  # GET /leaves
  # GET /leaves.json
  def index
    if(params[:employee_id].nil?)
      @employees = Employee.find(:all, conditions: {status: "A"})
    else
      @employee = Employee.find(params[:employee_id])
      render 'employee_index'
    end
  end

  # GET /leaves/1
  # GET /leaves/1.json
  def show
    @leave = Leave.find(params[:id])

  end

  # GET /leaves/new
  # GET /leaves/new.json
  def new
    @employee = Employee.find(params[:employee_id])
    @leave = @employee.leaves.build
  end

  # GET /leaves/1/edit
  def edit
    @leave = Leave.find(params[:id])
  end

  # POST /leaves
  # POST /leaves.json
  def create
    @employee = Employee.find(params[:employee_id])
    @leave = @employee.leaves.build(params[:leave])
    
    respond_to do |format|
      if @leave.save
        format.html { redirect_to employee_leaves_path(@employee), success: 'leave was successfully created.' }
      else
        format.html { render action: "new" }        
      end
    end
  end

  # PUT /leaves/1
  # PUT /leaves/1.json
  def update
    @leave = Leave.find(params[:id])

    respond_to do |format|
      if @leave.update_attributes(params[:leave])
        format.html { redirect_to @leave, success: 'leave was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaves/1
  # DELETE /leaves/1.json
  def destroy
    @leave = Leave.find(params[:id])
    @leave.destroy

    respond_to do |format|
      format.html { redirect_to leaves_url }
      format.json { head :no_content }
    end
  end
  
end
