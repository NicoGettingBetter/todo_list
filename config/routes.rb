Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  get 'pages/queries'

  resources :lists, only: [:create, :destroy, :update]
  resources :tasks, only: [:create, :destroy, :update]

end
