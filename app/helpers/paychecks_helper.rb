module PaychecksHelper
  def get_end_date_for(t)
    t = t.change(hour:0, min:0, sec:0, usec:0)
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
end
