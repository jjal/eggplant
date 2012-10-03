class WorkedShiftsController < ApplicationController
  include PaychecksHelper
  def index
    @employee = Employee.find(params[:employee_id])
  end
  
  def shifts
    @employee = Employee.find(params[:employee_id])
    start_times = params[:start_times]
    end_times = params[:end_times]
    start_times.each do |i,v|
      if(!start_times[i].empty? && !end_times[i].empty?)
        ws = WorkedShift.find(:first, conditions: {start_at: 0})
        if(ws.nil?)
          ws = WorkedShift.new
          ws.employee_id = @employee.id
        end
        ws.start_at = get_date_for_day start_times[i]
        ws.end_at = get_date_for_day end_times[i]
        ws.save
      end
    end
    render 'index'
  end
end