class CircleEventTicket < ActiveRecord::Base

	belongs_to :circle_event
	belongs_to :user

	validates :circle_event_id,presence: true
	validates :user_id,uniqueness: { scope: [:circle_event_id] }

end
