json.array!(@artists) do |artist|
  json.extract! artist, :id, :artistname, :first_name, :last_name, :country, :genre
  json.url artist_url(artist, format: :json)
end
