Rails.application.routes.draw do
	resources :chats
	resources :trips do
		resources :checkins, only: :create
	end

	root 'trips#index'
end
