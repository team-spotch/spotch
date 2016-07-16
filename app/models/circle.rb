class Circle < ActiveRecord::Base

	mount_uploader :image,ImageUploader

	has_many :circle_users,dependent: :destroy
	has_many :circle_members,through: :circle_users,source: :user
end
