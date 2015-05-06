class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	ratyrate_rater
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :posts
	has_many :comments
	
	def show
  @user = User.find(params[:id])
  @posts = @user.posts
		
end
end
