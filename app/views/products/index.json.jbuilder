json.array!(@products) do |product|
  json.extract! product, :id, :product, :user_id, :title, :description, :price
  json.url product_url(product, format: :json)
end
