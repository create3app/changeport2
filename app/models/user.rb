class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :posts
	has_many :comments
	def show
  @user = User.find(params[:id])
  @posts = @user.posts
		
		def fullname
  "#{first_name} #{last_name}"
end
end
end
