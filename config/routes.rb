Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'users/:username', to: 'users#show'
  get 'users/:username/user_posts', to: 'users#user_posts'

  root 'posts#index'

  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  resources :users do
    resources :comments
  end
end
