Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :groups
  resources :users do
    resources :products, except: :index
  end

  get '/products' => 'products#index'
  resources :sessions, only: [:new, :create, :destroy]
end
