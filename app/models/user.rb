class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :circle_users,dependent: :destroy
  has_many :circle_talks
  has_many :circle_events
  has_many :circle_event_tickets
  has_many :circle_event_talks
  
end
