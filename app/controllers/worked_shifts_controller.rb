class WorkedShiftsController < ApplicationController
  def index
    @employee = Employee.find(params[:employee_id])
  end
  
  def shifts
  end
  
end