class AddPrimaryKeyToLinkTab < ActiveRecord::Migration
  def change
  	add_column :event_team_users, :id, :primary_key
  end
end
