Rails.application.routes.draw do
    root 'posts#index'

    post '/rate' => 'rater#create', as: 'rate'

    devise_for :users
	resources :users, only: [:index, :show] do 
        get 'follow' => 'follows#create'
        get 'unfollow' => 'follows#destroy'
    end

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
end



