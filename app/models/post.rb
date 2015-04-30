class Post < ActiveRecord::Base
	ratyrate_rateable 'Ease', 'Effectiveness'
	acts_as_votable
	belongs_to :user
	has_many :comments
		has_attached_file :image, styles: { medium: "600x600#", small: "200x200#" } 
		validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
