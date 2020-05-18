Rails.application.routes.draw do
  root 'static_pages#about'

  get '/about' => 'static_pages#about'
  
  resources :order_items, only: [:index]
  
  resources :purchase_orders do
    resources :order_items, only: [:show, :create, :new, :update, :edit, :destroy]
  end
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
