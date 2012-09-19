Eggplant::Application.routes.draw do
  resources :tickets do
    resources :order_items
  end

  root to: 'tickets#index'
end
