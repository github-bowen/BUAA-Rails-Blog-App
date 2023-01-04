json.extract! tourist_route, :id, :origin, :destination, :total_days, :cost, :agency, :created_at, :updated_at
json.url tourist_route_url(tourist_route, format: :json)
