json.extract! air_route, :id, :from, :to, :departure_time, :landing_time, :is_direct, :created_at, :updated_at
json.url air_route_url(air_route, format: :json)
