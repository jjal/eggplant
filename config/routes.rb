Eggplant::Application.routes.draw do
  resources :tickets do
    resources :order_items
  end
  
  resources :pay_rates
  resources :paychecks
  resources :leaves
  
  resources :employees do
    resources :worked_shifts do
      get 'shifts', :on => :collection
    end
    resources :leaves do
    end
    resources :adjustments do
    end
  end
  
  root to: 'employees#index'
  
end
