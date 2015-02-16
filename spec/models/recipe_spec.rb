require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "should be valid" do
    r = recipe_valid
    expect(r).to be_valid
  end

  it "should be invalid" do
    r = recipe_invalid 
    expect(r).to_not be_valid
  end

  def recipe_valid
    Recipe.new.tap do |r|
      r.ingredients = "Sugar\nSalt\n2 tablespons cinnamon"
      r.procedure = "2 hours boiling"
      r.cuisine = Cuisine.new(name: "Japonese")
      r.food_type = FoodType.new(name: "dinner")
      r.food_preference = FoodPreference.new(name: "vegan")
      r.name = "Recipe Test"
    end
  end

  def recipe_invalid
    Recipe.new.tap do |r|
      r.difficulty = "Hard"
    end
  end
end
