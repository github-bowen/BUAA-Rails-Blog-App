json.extract! room_type, :id, :name, :has_window, :price, :created_at, :updated_at
json.url room_type_url(room_type, format: :json)
