class PaychecksController < ApplicationController
  include PaychecksHelper
  
  # GET /paychecks
  # GET /paychecks.json
  def index  
    @employees = Employee.find(:all, conditions: ["datedeactivated is null or datedeactivated > ?",current_pay_period.first])
    @paychecks = @employees
      .collect { |e| e.current_paycheck(current_pay_period.last) }
      .find_all{ |p| 
        !p.nil? and !p.pay_rate.nil? and (!p.pay_rate.monthly? or (p.pay_rate.monthly? and current_pay_period.last == p.end_at))
      }
    @total_payroll = 0
    @total_soksa = 0
    @total_cafe = 0
    @total_kinyei = 0
    @paychecks.each { |p| 
      #if it's the current paycheck, consider recounting its summary fields
      if(current_pay_period.last == p.end_at)
        p.recount  
      end
      @total_payroll += p.get_total_pay || 0 
      @total_cafe += p.pay_rate.cost_center_id == CostCenter::CAFE ? p.get_total_pay || 0 : 0
      @total_soksa += p.pay_rate.cost_center_id == CostCenter::SOKSABIKE ? p.get_total_pay || 0 : 0
      @total_kinyei += p.pay_rate.cost_center_id == CostCenter::KINYEI || p.pay_rate.cost_center_id.nil? ? p.get_total_pay || 0 : 0
    }
    respond_to do |format|
      format.html
      format.xls do
        render :xls => @paychecks,
                     :columns => [ {:employee=> [:name]}, {:pay_rate => [:name, :FTE]}, :start_at, :end_at, :total_hours, :total_adjustments_pay, :total_leave_taken, :total_leave_balance, :total_pay  ],
                     :headers => %w[ Name Position FTE Start End Hours Adjustments Leave Balance Pay ]
      end
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
