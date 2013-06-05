class PaychecksController < ApplicationController
  include PaychecksHelper
  
  # GET /paychecks
  # GET /paychecks.json
  def index  
    @paychecks = Paycheck.for_period(current_pay_period)
    
    #if it's the current paycheck, consider recounting its summary fields
    @paychecks.each { |p| p.recount if current_pay_period.last == p.end_at }

    @stats = Paycheck.get_stats_for(@paychecks)

    respond_to do |format|
      format.html
      format.xls do
        @payrolls = {}
        period = current_pay_period
        i = 0
        #limit to 100 to prevent massive downloads
        while(period.first >= Paycheck.find(:all, order: :start_at).first.start_at && (i <= 100)) do
          paychecks = Paycheck.for_period(period)
          stats = Paycheck.get_stats_for(paychecks)
          @payrolls[period] = {
            paychecks: paychecks,
            stats: stats
          }
          i += 1
          period = get_pay_period_for(period.first - 1.day)
        end
      end
      #do
      #  render :xls => @paychecks,
      #               :columns => [ {:employee=> [:name]}, {:pay_rate => [:name, :FTE]}, :start_at, :end_at, :total_hours, :total_adjustments_pay, :total_leave_taken, :total_leave_balance, :total_pay  ],
      #               :headers => %w[ Name Position FTE Start End Hours Adjustments Leave Balance Pay ]
      #end
    end
  end
  
  def mail 
    PayrollMailer.monthly_report(@paychecks).deliver
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
end
