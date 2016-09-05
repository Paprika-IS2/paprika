json.extract! following, :id, :user_id, :follower, :created_at, :updated_at
json.url following_url(following, format: :json)