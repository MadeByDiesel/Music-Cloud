json.array!(@tracks) do |track|
  json.extract! track, :id, :track_title, :description, :track_type
  json.url track_url(track, format: :json)
end
