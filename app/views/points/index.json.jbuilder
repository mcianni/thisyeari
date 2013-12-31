json.array!(@points) do |point|
  json.extract! point, :id, :quantity, :comments
  json.url point_url(point, format: :json)
end
