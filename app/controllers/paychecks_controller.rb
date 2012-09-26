class PaychecksController < ApplicationController
  include PaychecksHelper
  
	before_filter :ensure_paychecks_for_period, only: [:index]
  
  # GET /paychecks
  # GET /paychecks.json
  def index  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paychecks }
    end
  end

  # GET /paychecks/1
  # GET /paychecks/1.json
  def show
    @paycheck = Paycheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paycheck }
    end
  end

  # GET /paychecks/new
  # GET /paychecks/new.json
  def new
    @paycheck = Paycheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @paycheck }
    end
  end

  # GET /paychecks/1/edit
  def edit
    @paycheck = Paycheck.find(params[:id])
  end

  # POST /paychecks
  # POST /paychecks.json
  def create
    @paycheck = Paycheck.new(params[:paycheck])

    respond_to do |format|
      if @paycheck.save
        format.html { redirect_to @paycheck, notice: 'Paycheck was successfully created.' }
        format.json { render json: @paycheck, status: :created, location: @paycheck }
      else
        format.html { render action: "new" }
        format.json { render json: @paycheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /paychecks/1
  # PUT /paychecks/1.json
  def update
    @paycheck = Paycheck.find(params[:id])

    respond_to do |format|
      if @paycheck.update_attributes(params[:paycheck])
        format.html { redirect_to @paycheck, notice: 'Paycheck was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @paycheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paychecks/1
  # DELETE /paychecks/1.json
  def destroy
    @paycheck = Paycheck.find(params[:id])
    @paycheck.destroy

    respond_to do |format|
      format.html { redirect_to paychecks_url }
      format.json { head :no_content }
    end
  end
  
  private
    #make sure we have all the paychecks for the current period
    def ensure_paychecks_for_period
      @startDate = get_start_date_for(Time.now)
      @endDate = get_end_date_for(Time.now)
      @employees = Employee.all
      @employees.each do |e|
        if(e.paychecks.find(:all, conditions: { start_at: @startDate, end_at: @endDate }).size == 0)
          e.paychecks << Paycheck.new(start_at: @startDate, end_at: @endDate)
          e.save
        end
      end
    end
end
