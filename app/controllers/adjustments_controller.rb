class AdjustmentsController < ApplicationController
  # GET /adjustments
  # GET /adjustments.json
  def index
    if(!params[:paycheck_id].nil?)
      @paycheck = Paycheck.find(params[:paycheck_id])
      render 'paycheck_index'
    else
      @employees = Employee.all
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
    @paycheck = Paycheck.find(params[:paycheck_id])
    @adjustment = @paycheck.adjustments.build
  end

  # GET /adjustments/1/edit
  def edit
    @adjustment = adjustment.find(params[:id])
  end

  # POST /adjustments
  # POST /adjustments.json
  def create
    @paycheck = Paycheck.find(params[:paycheck_id])
    @adjustment = @paycheck.adjustments.build(params[:adjustment])
    
    respond_to do |format|
      if @adjustment.save
        format.html { redirect_to paycheck_adjustments_path(@paycheck), success: 'adjustment was successfully created.' }
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
        format.html { redirect_to @adjustment, success: 'adjustment was successfully updated.' }
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
    @adjustment = Adjustment.find(params[:id])
    @adjustment.destroy

    respond_to do |format|
      format.html { redirect_to adjustments_url }
      format.json { head :no_content }
    end
  end
  
end
