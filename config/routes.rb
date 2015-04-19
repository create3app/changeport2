Rails.application.routes.draw do
  devise_for :users
		resources :users, only: [:show]
	resources :posts do
		member do
			get "like", to: "posts#upvote"
			get "dislike", to: "posts#downvote"
		end
		resources :user_follows
		
		resources :comments
		
	end
	root 'posts#index'
end 


