json.extract! recipe_comment, :id, :user_id, :recipe_id, :comment, :created, :created_at, :updated_at
json.url recipe_comment_url(recipe_comment, format: :json)