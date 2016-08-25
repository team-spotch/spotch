class Circle < ActiveRecord::Base

	mount_uploader :image,ImageUploader

	has_many :circle_users,dependent: :destroy
	has_many :circle_members,through: :circle_users,source: :user
	has_many :circle_events,dependent: :destroy
	has_many :circle_talks,dependent: :destroy

	has_many :circle_likes


	validates :name,presence: true

	validate :add_error_sample

	def add_error_sample
		if name.empty?
			errors[:base] << "サークル名を入力してください"
		end
		if desc.empty?
			errors[:base] << "サークル概要を入力してください"
		end
	end


	def circle_member?(circle,user)
		circle_users.where(circle_id: circle.id,user_id: user.id).exists?
	end

	def circle_liked?(user)
		circle_likes.where(user_id: user.id).exists?
	end

end
