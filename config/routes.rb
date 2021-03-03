Rails.application.routes.draw do

  root  'problems#index'

    devise_for :users, controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks",
      passwords: 'users/passwords',
      confirmations: "confirmations"
    }

  resources :users, only: [:show]
  resources :labels
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  resources :problems do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    get :search, on: :collection
      collection do
        post :confirm

        resources :users, only: [:new, :create, :show]
      end
    end
  resources :relationships, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end
end
