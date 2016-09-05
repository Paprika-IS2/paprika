class CreateRecipeScores < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_scores do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
