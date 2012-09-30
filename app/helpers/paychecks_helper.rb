module PaychecksHelper
  def get_end_date_for(t)
    if(t.day <= 14)
      t = t.change(day: 14)
    else
     t = t.change(day: t.end_of_month.day)
    end
    t
  end
  
  def get_start_date_for(t)
    if(t.day >= 15)
      t = t.change(day: 15)
    else
      t = t.change(day: 1)
    end
    t
  end
  
  def current_pay_period
    get_start_date_for(DateTime.now)..get_end_date_for(DateTime.now)
  end 
end
