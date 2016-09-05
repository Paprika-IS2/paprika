class CreateTypeFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :type_foods do |t|
      t.string :name

      t.timestamps
    end
  end
end
