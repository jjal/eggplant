Eggplant::Application.routes.draw do
  resources :tickets do
    resources :order_items
  end
  
  resources :pay_rates
  resources :paychecks
  
  resources :employees do
    resources :worked_shifts do
      get 'shifts', :on => :collection
    end
  end
  
  root to: 'employees#index'
  
end
