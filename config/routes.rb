Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root  'homes#index'

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks",
    passwords: 'users/passwords',
  }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup
  resources :users, only: [:show ,:edit]
  resources :labels
  resources :likes, only: [:create, :destroy]

  resources :problems do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]

      collection do
        post :confirm

        resources :users, only: [:new, :create, :show]
      end
    end
  resources :relationships, only: [:create, :destroy]

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
