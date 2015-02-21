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

  context "favorites" do
    before do
    end
    it "should have a list of users who liked this recipe" do
      recipe = FactoryGirl.build(:recipe)
      user1 = FactoryGirl.build(:user1)
      user2 = FactoryGirl.build(:user2)
      recipe.users_who_liked << user1
      recipe.users_who_liked << user2

      expect(recipe.users_who_liked.size).to eq(2)
      expect(recipe.users_who_liked).to include(user1)
      expect(recipe.users_who_liked).to include(user2)
    end

    it "should return a ordered list of most favorites recipes" do
      recipe1 = FactoryGirl.create(:recipe)
      recipe2 = FactoryGirl.create(:recipe_cake)
      user1 = FactoryGirl.create(:user1)
      user2 = FactoryGirl.create(:user2)

      recipe1.users_who_liked << user1
      recipe1.users_who_liked << user2

      recipe2.users_who_liked << user2
      expect(Recipe.most_favorites.first).to eq(recipe1)
      expect(Recipe.most_favorites.last).to eq(recipe2)
    end
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
