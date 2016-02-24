Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :lists, only: [:create, :destroy, :edit]
  resources :tasks, only: [:create, :destroy, :edit, :update]

end
