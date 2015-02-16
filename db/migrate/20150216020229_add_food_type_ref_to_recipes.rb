class AddFoodTypeRefToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :food_type, index: true
    add_foreign_key :recipes, :food_types
  end
end
