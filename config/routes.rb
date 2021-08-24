Rails.application.routes.draw do
  root 'tweets#index'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tweets
  resources :users do
  end
end
