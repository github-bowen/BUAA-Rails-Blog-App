json.extract! hotel, :id, :name, :types, :rate, :location, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
