class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :photo
      t.text :info
      t.integer :calories
      t.integer :fat_calories
      t.float :cholesterol
      t.float :sodium
      t.float :sugar
      t.float :protein
      t.float :carbohydrates

      t.timestamps
    end
  end
end
