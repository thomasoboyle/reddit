Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'users#new'
  post '/login', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

  resources :posts do
    resources :comments
  end

  root 'posts#index'

  resources :users do
    resources :comments
  end
end
