	class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@posts = Post.includes(:user, :comments).all.order("created_at DESC")
	end

	def show
		set_post
	end
		
	def new
		@post = current_user.posts.build
	end
		
	def create
		@post = current_user.posts.build(post_params)
		if @post.save 
			redirect_to post_path(@post)
		else 
			render action: :new
		end
	end

	def edit
		set_post
	end
		
	def update
		set_post
		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			render action: :edit
		end
	end
		
	def destroy
		set_post
		@post.destroy
		redirect_to root_path
	end 
	
	def upvote 
		set_post
		@post.upvote_by current_user
		redirect_to :back
	end
	
	def downvote
		set_post
		@post.downvote_from current_user
		redirect_to :back
	end
	
	private
		
	def set_post
		@post ||= Post.find(params[:id])
	end
			
	def post_params
		params.require(:post).permit(:title, :link, :description, :image, :status)
	end		
end