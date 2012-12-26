class EmployeesController < ApplicationController
 def index
		@employees = Employee.paginate(
        conditions: {status: "A"},
        page: params[:page],
        order: :name
      )
	end
	
	def show
		@employee = Employee.find(params[:id])
	end
	
	def edit
    @employee = Employee.find(params[:id])
  end
	
	def new
		@employee = Employee.new
  end
	
	def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      flash[:success] = "New employee created"
      redirect_to employees_url
    else
      render 'new'
    end
  end
	
	def update
		@employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
			flash[:success] = "Employee updated"
      redirect_to employees_url
    else
      render 'edit'
    end
  end
	 
	def destroy
    Employee.find(params[:id]).update_attribute(:status, "X")
    flash[:success] = "Employee deleted."
    redirect_to employees_url
  end
  
  def paycheck_shifts
    @employee = Employee.find(params[:id])
  end
end