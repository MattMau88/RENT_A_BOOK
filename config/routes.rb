Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    resources :rentals, only: [ :new, :create ]
  end
  resources :pages
  resources :rentals, only: [:show]
  resources :users, only: [:show]

end
