require 'rails_helper'

RSpec.describe User, type: :model do
  it "should be valid with name, email and city" do
    user = User.new(name:"Test surname", email:"user@test.com", city: "Sao Paulo", password: "12345678", password_confirmation: "12345678")
    expect(user).to be_valid
  end

  it "should be valid without name, email and city" do
    user = User.new(facebook: "teste", twitter: "twitter")
    expect(user).to_not be_valid
  end

  context "favorites" do
    it "should have favorites recipes" do
      user = FactoryGirl.build(:user)
      recipe1 = FactoryGirl.create(:recipe)
      recipe2 = FactoryGirl.create(:recipe_cake)
      user.recipes << recipe1
      user.recipes << recipe2

      expect(user.recipes.size).to eq(2)
      expect(user.recipes).to include(recipe1)
      expect(user.recipes).to include(recipe2)
    end
  end
end
