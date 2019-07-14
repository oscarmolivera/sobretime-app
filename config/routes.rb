Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :posts
      resources :admin_users

      root to: "users#index"
    end
  resources :posts
  devise_for :users, skip: %i[registration]
  root 'static#homepage'  
end
