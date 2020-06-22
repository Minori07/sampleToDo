Rails.application.routes.draw do
	get 'tasks/mypage'

	resources :tasks
	devise_for :users
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get "home/top" => "home#top"

	devise_scope :user do
    	get '/users/sign_out' => 'devise/sessions#destroy'
  	end
	authenticated :users do
		root :to => "tasks#index"
	end
end
