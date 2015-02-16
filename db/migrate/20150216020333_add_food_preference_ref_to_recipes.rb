class AddFoodPreferenceRefToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :food_preference, index: true
    add_foreign_key :recipes, :food_preferences
  end
end
