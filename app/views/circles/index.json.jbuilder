json.array!(@circles) do |circle|
  json.extract! circle, :id, :name, :image, :desc
  json.url circle_url(circle, format: :json)
end
