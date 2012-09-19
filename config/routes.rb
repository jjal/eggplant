Eggplant::Application.routes.draw do
  resources :tickets do
    resources :order_items
  end
end
