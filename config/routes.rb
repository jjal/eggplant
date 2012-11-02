Eggplant::Application.routes.draw do
  resources :tickets do
    resources :order_items
  end
  
  resources :pay_rates
  resources :leaves
  resources :adjustments
  resources :worked_shifts
  
  resources :paychecks do
    resources :adjustments
  end
  resources :employees do
    resources :worked_shifts do
      post 'shifts', :on => :collection
    end
    resources :leaves
    resources :paychecks
  end
  
  root to: 'employees#index'
  
end
