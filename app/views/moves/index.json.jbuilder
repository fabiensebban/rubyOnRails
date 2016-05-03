json.array!(@moves) do |move|
  json.extract! move, :id, :name, :description, :type_id
  json.url move_url(move, format: :json)
end
