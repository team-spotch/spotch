class Circle < ActiveRecord::Base

	mount_uploader :image,ImageUploader

	has_many :circle_users
end
