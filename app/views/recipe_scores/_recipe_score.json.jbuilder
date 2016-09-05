json.extract! recipe_score, :id, :user_id, :recipe_id, :score, :created_at, :updated_at
json.url recipe_score_url(recipe_score, format: :json)