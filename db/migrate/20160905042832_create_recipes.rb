class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.integer :cook_time
      t.integer :calories
      t.float :score
      t.date :created
      t.references :type_dish, foreign_key: true
      t.references :type_food, foreign_key: true

      t.timestamps
    end
  end
end
