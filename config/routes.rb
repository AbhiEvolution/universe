Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :articles
  resources :users
  resources :categories, except: [:destroy]
end
