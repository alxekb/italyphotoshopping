json.extract! profile_item, :id, :item, :brand, :color, :price, :cost, :created_at, :updated_at
json.url profile_item_url(profile_item, format: :json)
