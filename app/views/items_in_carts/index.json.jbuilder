json.array!(@items_in_carts) do |items_in_cart|
  json.extract! items_in_cart, :id, :product_id, :cart_id
  json.url items_in_cart_url(items_in_cart, format: :json)
end
