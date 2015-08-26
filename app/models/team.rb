class Team < ActiveRecord::Base
  belongs_to :event
  belongs_to :owner, :class_name => "User"
  has_many :event_team_users
  has_many :users, :through => :event_team_users

end
