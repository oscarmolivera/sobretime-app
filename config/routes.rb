Rails.application.routes.draw do
  resources :audit_logs, except: %i[ new edit destroy] do
    member do
      get :confirm
    end
  end
  namespace :admin do
      resources :employees
      resources :posts
      resources :admin_users
      resources :users

      root to: "users#index"
    end
  resources :posts do
    member do
      get :approve
    end 
  end
  devise_for :users, skip: %i[registration]
  root 'static#homepage'  
end
