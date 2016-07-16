class CircleUser < ActiveRecord::Base

	belongs_to :circle, dependent: :destroy
	belongs_to :user, dependent: :destroy

end
