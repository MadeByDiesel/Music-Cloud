json.array!(@labels) do |label|
  json.extract! label, :id, :labelname, :city, :country, :contactname
  json.url label_url(label, format: :json)
end
