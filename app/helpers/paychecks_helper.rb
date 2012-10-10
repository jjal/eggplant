module PaychecksHelper
  def get_start_date_for(t)
    t = t.change(hour: 0)
    if(t.day >= 16)
      t = t.change(day: 16)
    else
      t = t.change(day: 1)
    end
    t
  end
  
  def get_end_date_for(t)
    t = t.change(hour: 23, minute: 59, second: 59)
    if(t.day <= 15)
      t = t.change(day: 15)
    else
     t = t.change(day: t.end_of_month.day)
    end
    t
  end
  
  def current_pay_period
    get_start_date_for(DateTime.now)..get_end_date_for(DateTime.now)
  end 
  
  def get_date_for_day(day_number, hours, minutes)
    DateTime.new(current_pay_period.first.year, current_pay_period.first.month, day_number.to_i, hours.to_i, minutes.to_i)
  end
end
