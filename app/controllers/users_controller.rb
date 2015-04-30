class UsersController < ApplicationController
	def new
  	@user = User.new
	end
	def show
		@user = User.find_by_name(params[:id])
		if @user
			@posts = @user.posts.all
			render action: :show
		else 
			render file: 'public/404', status:404, formats: [:html]
		end
	end 
end 