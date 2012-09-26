class EmployeesController < ApplicationController
 def index
		@employees = Employee.paginate(page: params[:page])
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
      redirect_to @employee
    else
      render 'new'
    end
  end
	
	def update
		@employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
			flash[:success] = "Employee updated"
      redirect_to @employee
    else
      render 'edit'
    end
  end
	 
	def destroy
    Employee.find(params[:id]).destroy
    flash[:success] = "employee destroyed."
    redirect_to employees_url
  end
end
