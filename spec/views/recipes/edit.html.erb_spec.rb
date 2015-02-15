require 'rails_helper'

RSpec.describe "recipes/edit", type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
      :name => "MyString",
      :serves => 1,
      :cooking_time => 1,
      :difficulty => "MyString",
      :ingredients => "MyText",
      :procedure => "MyText"
    ))
  end

  it "renders the edit recipe form" do
    render

    assert_select "form[action=?][method=?]", recipe_path(@recipe), "post" do

      assert_select "input#recipe_name[name=?]", "recipe[name]"

      assert_select "input#recipe_serves[name=?]", "recipe[serves]"

      assert_select "input#recipe_cooking_time[name=?]", "recipe[cooking_time]"

      assert_select "input#recipe_difficulty[name=?]", "recipe[difficulty]"

      assert_select "textarea#recipe_ingredients[name=?]", "recipe[ingredients]"

      assert_select "textarea#recipe_procedure[name=?]", "recipe[procedure]"
    end
  end
end
