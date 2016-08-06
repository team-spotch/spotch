class CircleTalk < ActiveRecord::Base

	belongs_to :circle
	belongs_to :user

	validates :circle_id,presence: true
	validates :user_id,presence: true
	validates :body,presence: true


end