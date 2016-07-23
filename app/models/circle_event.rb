class CircleEvent < ActiveRecord::Base

	belongs_to :circle
	belongs_to :author,foreign_key: :author_id,class_name: User

	has_many :circle_event_tickets	
	has_many :circle_event_members,through: :circle_event_tickets,source: :user

	validates :title,presence: true
	validates :desc,presence: true
	validates :author_id,presence: true

end