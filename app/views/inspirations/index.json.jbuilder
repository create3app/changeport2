json.array!(@inspirations) do |inspiration|
  json.extract! inspiration, :id, :user_id, :friend_id, :create, :destroy
  json.url inspiration_url(inspiration, format: :json)
end
