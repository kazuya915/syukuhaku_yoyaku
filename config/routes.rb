Rails.application.routes.draw do
  resources :rooms do

    collection do
      get "myrooms"
    end

    resources :reservations, only: [:index, :new, :create, :show] do

      collection do
        post :confirm
      end

    end
  end
  get 'reservations/create'
  get 'reservations/edit'

  devise_for :users
  get 'rooms/myrooms'
  root to: "home#index"
  resources :users


  resources :rooms
  get 'profile/edit', to: 'profiles#edit'
  get 'profile', to: 'profiles#show'


  resources :reservations do
    collection do
      post :confirm
    end
  end
  
  # resources :rooms do
  #   resources :reservations
  # end 

  # get 'reservations/confirm'

  # resources :users do
  #   member do
  #     get 'profile'
  #   end
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
