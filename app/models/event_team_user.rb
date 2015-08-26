class EventTeamUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :team
  belongs_to :user
end
