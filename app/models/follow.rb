# Follow Documentation
#
# The follow table is a HABTM relationship handler between the users.
# A user can see who they following and who is following them.

# == Schema Information
#
# Table name: follows
#
#  id                 :integer          not null, primary key
#  followee_id        :integer
#  follower_id        :integer          
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Follow < ActiveRecord::Base

    belongs_to :followee_user, class_name: 'User', foreign_key: 'followee_id'
    belongs_to :follower_user, class_name: 'User', foreign_key: 'follower_id'

    validates :follower_id,               presence: true
    validates :followee_id,               presence: true, uniqueness: { scope: :follower_id }
end