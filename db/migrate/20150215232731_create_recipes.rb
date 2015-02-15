class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :serves
      t.integer :cooking_time
      t.string :difficulty
      t.text :ingredients
      t.text :procedure

      t.timestamps null: false
    end
  end
end
