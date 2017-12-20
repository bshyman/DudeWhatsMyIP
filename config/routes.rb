Rails.application.routes.draw do

	root 'interfaces#index'

<<<<<<< Updated upstream
=======
  	resources :users do
		resources :interfaces
  	end

  get 'login', to: redirect('/auth/google'), as: 'login'
  # get 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'auth/:provider/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  # get 'home', to: 'home#show'
  # get 'me', to: 'me#show', as: 'me'
  # root to: "home#show"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

>>>>>>> Stashed changes
end
