require 'rails_helper'

RSpec.describe "recipes/show", type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
      :cuisine => Cuisine.create!(name: "cuisine"),
      :food_type => FoodType.create!(name: "food_type"),
      :food_preference => FoodPreference.create!(name: "food_preference"),
      :name => "Name",
      :serves => 1,
      :cooking_time => 2,
      :difficulty => "Difficulty",
      :ingredients => "MyText",
      :procedure => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Difficulty/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
