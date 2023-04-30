Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  get 'users/index'
  resources :users
  # get 'users/profile/edit'
  get 'users/profile'
  get 'users/profile/edit', to: 'profile#edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
