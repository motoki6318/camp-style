Rails.application.routes.draw do
  root to: "camps#index"
  devise_for :users
end
