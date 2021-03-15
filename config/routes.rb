Rails.application.routes.draw do
  root to: "camps#index"
  resources :camps, only: [:new, :create]
  resources :items, only: [:new, :create]
  devise_for :users
end
