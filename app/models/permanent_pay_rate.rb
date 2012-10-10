class PermanentPayRate < PayRate

  def calculate_pay(paycheck)
    return self.monthly_rate.to_f * self.FTE.to_f * get_pay_period_portion(paycheck)
  end
  
  def get_pay_period_portion(paycheck)
    #TODO this is just a stand-in to get it to work under the current system. It only really applies to permanent pay rates
    case (paycheck.end_at-paycheck.start_at) / 1.days
    when 14..16
      return 0.5
    when 28..31
      return 1.0
    else
      return 0.0
    end
  end
  
end