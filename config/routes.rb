Rails.application.routes.draw do

	root 'interfaces#index'
	resources :interfaces

end
