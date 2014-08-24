json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :rating, :address, :lat, :lon, :cuisine
  json.url restaurant_url(restaurant, format: :json)
end
