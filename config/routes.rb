Rails.application.routes.draw do
  root to: "problems#index"


  resources :problems do
      collection do
        post :confirm

        # resources :users, only: [:new, :create, :show]
      end
    end
end
