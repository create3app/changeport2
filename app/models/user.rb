class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
	ratyrate_rater
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :posts
	has_many :comments

    # Users which are following you
    has_many :follower_users, class_name: 'Follow', foreign_key: 'followee_id', dependent: :destroy
    has_many :followers, through: :follower_users, source: :follower_user

    # Users which you are following
    has_many :followee_users, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
    has_many :followees, through: :followee_users, source: :followee_user

    validates :email,                                                     presence: { message: 'is required' }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :name,                                                      presence: true

    def following? target_user
        # binding.pry
        return self.followees.include?(target_user) ? true : false
    end
end
