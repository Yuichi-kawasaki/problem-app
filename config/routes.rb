Rails.application.routes.draw do

  root  'problems#index'

    devise_for :users, controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks",
      passwords: 'users/passwords',
      confirmations: "confirmations"
  }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  resources :users, only: [:show, :index]
  resources :problems, only: [:index, :show, :create, :new, :edit] do
    resources :likes, only: [:create, :destroy]
  end
end
