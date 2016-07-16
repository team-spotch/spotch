class Circle < ActiveRecord::Base

	mount_uploader :image,ImageUploader

	has_many :circleUsers,dependent: :destroy
end
