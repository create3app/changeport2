class UsersController < ApplicationController
	before_action :authenticate_user!
	
	def index
		set_users
	end

	def show
		set_user
	end 

	private

	def set_user
		@user ||= User.includes(:posts).find(params[:id])
	end

	def set_users
		@users ||= User.all
	end
end 