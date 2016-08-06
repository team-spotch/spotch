class CircleEvent < ActiveRecord::Base

	belongs_to :circle
	belongs_to :author,foreign_key: :author_id,class_name: User

	has_many :circle_event_tickets	
	has_many :circle_event_members,through: :circle_event_tickets,source: :user

	has_many :circle_event_talks

	validates :title,presence: true
	validates :desc,presence: true
	validates :author_id,presence: true


	def event_pending?(event)
		circle_event_tickets.where(circle_event_id: event.id,confirm: false)
	end

	def ticket_status?(circle_event,user,status)
		circle_event_tickets.where(circle_event_id: circle_event.id,user_id: user.id,confirm: status)		
	end

	def event_participants(circle_event)
		circle_event_tickets.where(circle_event_id: circle_event.id,confirm: true)
	end

end