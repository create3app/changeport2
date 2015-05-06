class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
		@comments =Comment.where(post_id: @post)
	end
		
	def new
		@post = current_user.posts.build
	end
		
	def create
		set_post
		@post = current_user.posts.build(post_params)
		if @post.save 
			redirect_to @post
		else 
			render action: :new
		end
	end
	
	def edit

	end
		
	def update
		set_post
		if @post.update(post_params)
			redirect_to @post
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
		params.require(:post).permit(:title, :link, :description, :image)
	end		
end