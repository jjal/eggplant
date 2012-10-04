class AdjustmentsController < ApplicationController
  # GET /adjustments
  # GET /adjustments.json
  def index
    if(params[:employee_id].nil?)
      @employees = Employee.all
    else
      @employee = Employee.find(params[:employee_id])
      render 'employee_index'
    end
  end

  # GET /adjustments/1
  # GET /adjustments/1.json
  def show
    @adjustment = adjustment.find(params[:id])

  end

  # GET /adjustments/new
  # GET /adjustments/new.json
  def new
    @employee = Employee.find(params[:employee_id])
    @adjustment = @employee.adjustments.build
  end

  # GET /adjustments/1/edit
  def edit
    @adjustment = adjustment.find(params[:id])
  end

  # POST /adjustments
  # POST /adjustments.json
  def create
    @employee = Employee.find(params[:employee_id])
    @adjustment = @employee.adjustments.build(params[:adjustment])
    
    respond_to do |format|
      if @adjustment.save
        format.html { redirect_to employee_adjustments_path(@employee), notice: 'adjustment was successfully created.' }
      else
        format.html { render action: "new" }        
      end
    end
  end

  # PUT /adjustments/1
  # PUT /adjustments/1.json
  def update
    @adjustment = adjustment.find(params[:id])

    respond_to do |format|
      if @adjustment.update_attributes(params[:adjustment])
        format.html { redirect_to @adjustment, notice: 'adjustment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @adjustment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adjustments/1
  # DELETE /adjustments/1.json
  def destroy
    @adjustment = adjustment.find(params[:id])
    @adjustment.destroy

    respond_to do |format|
      format.html { redirect_to adjustments_url }
      format.json { head :no_content }
    end
  end
  
end
