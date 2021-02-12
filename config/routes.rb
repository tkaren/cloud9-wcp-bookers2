Rails.application.routes.draw do
  get 'users/show'
  root to: 'homes#top'
  get 'homes/about'
  devise_for :users
  resources :users
end
