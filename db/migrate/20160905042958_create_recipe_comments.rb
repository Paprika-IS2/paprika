class CreateRecipeComments < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_comments do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true
      t.text :comment
      t.date :created

      t.timestamps
    end
  end
end
