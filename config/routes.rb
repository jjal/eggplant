Eggplant::Application.routes.draw do
  resources :tickets do
    resources :order_items
  end
  
  resources :pay_rates
  
  resources :employees 
  
  root to: 'employees#index'
end
