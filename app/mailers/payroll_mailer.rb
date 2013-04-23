class PayrollMailer < ActionMailer::Base
  default from: "accounts@kinyei.org"
  def monthly_report(paychecks)
    @paychecks = paychecks
    mail(:to => "justin@kinyei.org", :subject => "Payroll #{DateTime.Now}")
  end
end
