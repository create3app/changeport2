class Post < ActiveRecord::Base

	ratyrate_rateable 'Ease', 'Effectiveness'
	acts_as_votable

	belongs_to :user

    has_attached_file :image, styles: { medium: "600x600#", small: "200x200#" } 
	has_many :comments

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

    enum status: [:in_progress, :completed]
end
