module CoreExtensions
  module EventCalendar
    
    module ClassMethods

      # Get the events overlapping the given start and end dates
      # Monkey patching b/c "scoped" method no longer valid in Rails 4
      def events_for_date_range(start_d, end_d, find_options = {})
        self.all(find_options).find(
          :all,
          :conditions => [ "(? <= #{self.quoted_table_name}.#{self.end_at_field}) AND (#{self.quoted_table_name}.#{self.start_at_field}< ?)", start_d.to_time.utc, end_d.to_time.utc ],
          :order => "#{self.quoted_table_name}.#{self.start_at_field} ASC"
        )
      end

    end
  end
end