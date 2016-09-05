class CreateRecipeTags < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_tags do |t|
      t.references :recipe, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
