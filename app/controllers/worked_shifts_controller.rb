class WorkedShiftsController < ApplicationController
  include PaychecksHelper
  def index
    
    if(params[:employee_id].nil?)
      @employees = Employee.find(:all, conditions: {status: "A"})
    else
      @employee = Employee.find(params[:employee_id])
      render "employee_index"
    end
  end
  
  def shifts
    @employee = Employee.find(params[:employee_id])
    shift_times = params[:shift_times]
    shift_times.each do |day, v|
      logger.debug "processing data #{v.inspect}"
      unless (v['start'].empty? || v['end'].empty?)
        #try and get any existing worked shift for this date
        ws = @employee.worked_shifts.find(:first, conditions: { start_at: get_date_for_day(@employee, day, 0, 0)..get_date_for_day(@employee, day, 23, 59) })
        if(ws.nil?)
          ws = @employee.worked_shifts.build
        end
        ws.start_at = get_date_for_day(@employee, day, parse_hours(v['start']), parse_minutes(v['start']))
        ws.end_at = get_date_for_day(@employee, day, parse_hours(v['end']), parse_minutes(v['end']))
        ws.save
        logger.debug "made #{ws.inspect}"
      end 
    end
    redirect_to worked_shifts_path
  end
  
  private
    def parse_hours(str)
      return str[/([0-9]*)\:/, 1]
    end
    
    def parse_minutes(str)
      return str[/\:([0-9]*)/, 1]
    end
end 