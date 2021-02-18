Rails.application.routes.draw do
  root to:  'sessions#new'
    devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }


  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]

  # omniauth_for :users, controllers: { '/auth/:provider/callback'
  #   to: 'sessions#create'}
  #
  # get '/logout', to: 'sessions#destroy'


  resources :problems do
      collection do
        post :confirm

        resources :users, only: [:new, :create, :show]
      end
    end
end
