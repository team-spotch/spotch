class CircleUser < ActiveRecord::Base

	belongs_to :circle
	belongs_to :user

	validates :user_id,uniqueness: { scope: :circle_id }

end
