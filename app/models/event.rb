class Event < ActiveRecord::Base
  has_event_calendar
  has_many :event_team_users
  has_many :users, :through => :event_team_users
  has_many :teams


include CoreExtensions::EventCalendar::ClassMethods

      # Get the events overlapping the given start and end dates
      # Monkey patching b/c "scoped" method no longer valid in Rails 4
      def self.events_for_date_range(start_d, end_d, find_options = {})
		conditions = [ "(? <= #{self.quoted_table_name}.#{self.end_at_field}) AND (#{self.quoted_table_name}.#{self.start_at_field}< ?)", start_d.to_time.utc, end_d.to_time.utc ]
		order_string = "#{self.quoted_table_name}.#{self.start_at_field} ASC"
		self.where(find_options).where(conditions).order(order_string)
        # self.all.scoped(find_options).find(
        #   :all,
        #   :conditions => [ "(? <= #{self.quoted_table_name}.#{self.end_at_field}) AND (#{self.quoted_table_name}.#{self.start_at_field}< ?)", start_d.to_time.utc, end_d.to_time.utc ],
        #   :order => "#{self.quoted_table_name}.#{self.start_at_field} ASC"
        # )
      end
end
