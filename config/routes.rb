Rails.application.routes.draw do
  resources :posts
  devise_for :users, skip: %i[registration]
  root 'static#homepage'
end
