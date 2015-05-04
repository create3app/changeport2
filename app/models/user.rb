class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	ratyrate_rater
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :posts
	has_many :comments
	has_many :inspirations
	has_many :friends, :through => :inspirations
	
	def show
  @user = User.find(params[:id])
  @posts = @user.posts
		
end
end
