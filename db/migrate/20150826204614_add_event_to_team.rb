class AddEventToTeam < ActiveRecord::Migration
  def change
  	add_column :teams, :event_id, :integer
  	add_column :events, :uid, :string
  end
end
