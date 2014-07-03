json.array!(@fans) do |fan|
  json.extract! fan, :id, :first_name, :last_name, :username, :city, :country
  json.url fan_url(fan, format: :json)
end
