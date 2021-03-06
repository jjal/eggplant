module PaychecksHelper
  
  def get_start_date_for(t, monthly=false)
    t = t.change(hour: 0)
    if(t.day >= 16 && !(monthly||false))
      t = t.change(day: 16)
    else
      t = t.change(day: 1)
    end
    t
  end
  
  def get_end_date_for(t, monthly=false)
    t = t.change(hour: 23, minute: 59, second: 59)
    if(t.day <= 15 && !(monthly||false))
      t = t.change(day: 15)
    else
     t = t.change(day: t.end_of_month.day)
    end
    t
  end
  
  def get_pay_period_for(t)
    return get_start_date_for(t)..get_end_date_for(t)
  end

  def current_pay_period=(daterange)
    session[:current_pay_period] = daterange
  end
  
  def current_pay_period(employee=nil)
    
    session[:current_pay_period] ||= get_start_date_for(DateTime.now)..get_end_date_for(DateTime.now)
    
    if(employee.nil?)
      return session[:current_pay_period]
    else
      return get_start_date_for(session[:current_pay_period].first, employee.pay_rate.monthly?)..get_end_date_for(session[:current_pay_period].first, employee.pay_rate.monthly?)
    end
    
  end 
  
  def get_date_for_day(employee, day_number, hours, minutes)
    DateTime.new(current_pay_period(employee).first.year, current_pay_period(employee).first.month, day_number.to_i, hours.to_i, minutes.to_i)
  end
  
end
