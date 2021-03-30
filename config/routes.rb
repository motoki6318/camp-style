Rails.application.routes.draw do
  root to: "camps#index"
  resources :camps, only: [:new, :create, :show, :edit, :update] do
    resources :comments, only: [:new, :create]
  end
  resources :items, only: [:new, :create, :show, :edit, :update]
  devise_for :users
end
