Rails.application.routes.draw do
  root to: "camps#index"
  resources :camps, only: [:new, :create, :show]
  resources :items, only: [:new, :create, :show]
  devise_for :users
end
