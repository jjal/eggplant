class SessionsController < ApplicationController
  include PaychecksHelper
  
  def previous_pay_period
    session[:current_pay_period] = get_pay_period_for(current_pay_period.first - 1.day)
    redirect_to request.referer
  end
  
  def next_pay_period
    session[:current_pay_period] = get_pay_period_for(current_pay_period.last + 1.day)
    redirect_to request.referer
  end
  
end
