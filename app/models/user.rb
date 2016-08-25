class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :relationships, foreign_key: :follower_id
   has_many :followings, through: :relationships

   has_many :inverse_follows, foreign_key: :following_id, class_name: Relationship
   has_many :followers, through: :inverse_follows

   has_many :circle_likes

   has_one :user_prof

   def followed_by? user
   	inverse_follows.where(follower_id: user.id).exists?
   end

  has_many :circle_users,dependent: :destroy
  has_many :circle_talks
  has_many :circle_events
  has_many :circle_event_tickets
  has_many :circle_event_talks
  
end
