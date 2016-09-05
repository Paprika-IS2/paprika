json.extract! recipe_tag, :id, :recipe_id, :tag_id, :created_at, :updated_at
json.url recipe_tag_url(recipe_tag, format: :json)