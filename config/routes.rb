Eggplant::Application.routes.draw do
  resources :tickets do
    resources :order_items
  end
  
  resources :pay_rates
  resources :paychecks
  
  resources :employees do
    resources :worked_shifts
  end
  
  root to: 'employees#index'
  
  
end
