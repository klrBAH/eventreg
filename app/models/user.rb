class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :event_team_users
  has_many :events, :through => :event_team_users
  has_many :teams, :through => :event_team_users

  scope :singletons, -> {joins(:event_team_users).where(:event_team_users => {:team_id => -1 })}
  scope :members, -> {joins(:event_team_users).where.not(:event_team_users => {:team_id => -1 })}

end
