# rubocop:disable all

Rails.application.routes.draw do
  devise_for :users
  resources :conversation_users
  resources :tweets do
    resources :replies, except: [:destroy]
    resources :likes, only: [:create]
    resources :bookmarks, only: [:create]
  end

  resources :replies do
    resources :replies, except: [:destroy]
    resources :likes, only: [:create]
    resources :bookmarks, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index', via: :all

  resources :users do
    resources :relations, only: [:create]
    member do
      get :following
      get :followers
    end
  end

  resources :relations, only: [:destroy]
  resources :likes, only: [:destroy]
  resources :bookmarks, only: %i[destroy index]
  resources :replies, only: %i[destroy]

  resources :conversations do
    resources :messages
    mount ActionCable.server, at: '/cable'

    collection do
      get :new_group
    end
  end

  resources :notifications
  mount ActionCable.server, at: '/cable'

end
