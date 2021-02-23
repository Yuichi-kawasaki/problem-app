Rails.application.routes.draw do

  root  'problems#index'

    devise_for :users, controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks",
      passwords: 'users/passwords'
  }
  resources :users, only: [:show]

  resources :problems do
      collection do
        post :confirm

        resources :users, only: [:new, :create, :show]
      end
    end
end
