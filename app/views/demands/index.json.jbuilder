json.array!(@demands) do |demand|
  json.extract! demand, :id, :description, :user_id
  json.url demand_url(demand, format: :json)
end
