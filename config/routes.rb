Rails.application.routes.draw do
  get 'users/new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :posts do
    resources :comments
  end

  root 'posts#index'

  resources :users
end
