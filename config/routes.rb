Rails.application.routes.draw do
  devise_for :users
  root "splashes#index"
  resources :entities
  resources :groups do
    resources :entities
  end
end

