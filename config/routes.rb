Rails.application.routes.draw do
  resources :inspirations
  resources :friendships
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
		resources :users, only: [:show]
	resources :posts do
		member do
			patch :complete
		end 
		member do
			get "like", to: "posts#upvote"
			get "dislike", to: "posts#downvote"
		end
		resources :comments
	end
	root 'posts#index'
	end



