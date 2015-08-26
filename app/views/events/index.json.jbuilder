json.array!(@events) do |event|
  json.extract! event, :id, :name, :start_at, :end_at, :max_teams, :max_team_members, :min_team_members
  json.url event_url(event, format: :json)
end
