Rails.application.routes.draw do
  get 'users/new'

  resources :posts do
    resources :comments
  end

  root 'posts#index'
end
