class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :type_dish
  belongs_to :type_food
end
