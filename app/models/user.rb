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
	has_many :inverse_inspirations, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_inspirations, :source => :user
	
	def show
  @user = User.find(params[:id])
  @posts = @user.posts
		
end
end
