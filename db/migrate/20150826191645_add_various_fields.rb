class AddVariousFields < ActiveRecord::Migration
  def change
  	change_table :events do |t|
		t.integer :max_teams, index: true
		t.integer :max_team_members, index: true
		t.integer :min_team_members, index: true
		t.integer :owner_id, index: true
		t.string :address
		t.string :address2
		t.string :city
		t.string :state
		t.integer :zip
		t.string :country
		t.string :phone
		t.string :loc_note
		t.string :website
		t.float :latitude
    	t.float :longitude
    	 
	end
	change_table :users do |t|
		t.string :first_name
		t.string :last_name
		t.integer :empl_num, index: true
	end
    create_table :teams do |t|
		t.string :name, index: true
		t.integer :owner_id, index: true
		t.string :uid, index: true

		t.timestamps null: false
    end
    create_table :event_team_users, id: false do |t|
		t.belongs_to :user, index: true
		t.belongs_to :team, index: true
		t.belongs_to :event, index: true

		t.timestamps null: false
	end
  end
end
