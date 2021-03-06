# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tweets#index'

  devise_for :users

  resources :tweets do
    resources :comments
    member do
      put 'like', to: 'tweets#like'
      put 'dislike', to: 'tweets#dislike'
    end
  end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  resources :users do
    get 'profile', to: 'users#profile'
  end

  get 'ping_user', to: 'users#ping_user'
end
