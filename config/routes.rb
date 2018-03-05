Rails.application.routes.draw do

  resources :sessions, only: [:create, :destroy]

  resources :users do
    resources :interfaces
  end

  get 'login', to: redirect('/auth/google'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'current_user_route', to: "users#current_user_route"
  get 'pages/visitor', to: 'pages#visitor', as: 'visitor'


	root 'pages#visitor'
end
