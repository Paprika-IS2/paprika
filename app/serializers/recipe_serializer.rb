class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cook_time, :calories, :score
end
