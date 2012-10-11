class CasualPayRate < PayRate
  def calculate_pay(paycheck)
    paycheck.get_hours * hourly_rate
  end
end