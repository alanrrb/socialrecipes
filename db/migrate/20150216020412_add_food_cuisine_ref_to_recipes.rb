class AddFoodCuisineRefToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :cuisine, index: true
    add_foreign_key :recipes, :cuisines
  end
end
