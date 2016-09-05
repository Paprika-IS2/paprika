json.extract! recipe, :id, :user_id, :name, :description, :cook_time, :calories, :score, :created, :type_dish_id, :type_food_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)