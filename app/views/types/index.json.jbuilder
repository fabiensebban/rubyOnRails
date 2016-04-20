json.array!(@types) do |type|
  json.extract! type, :id, :name, :color
  json.url type_url(type, format: :json)
end
