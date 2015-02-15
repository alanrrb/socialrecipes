require 'rails_helper'

RSpec.describe "recipes/new", type: :view do
  before(:each) do
    assign(:recipe, Recipe.new(
      :name => "MyString",
      :serves => 1,
      :cooking_time => 1,
      :difficulty => "MyString",
      :ingredients => "MyText",
      :procedure => "MyText"
    ))
  end

  it "renders new recipe form" do
    render

    assert_select "form[action=?][method=?]", recipes_path, "post" do

      assert_select "input#recipe_name[name=?]", "recipe[name]"

      assert_select "input#recipe_serves[name=?]", "recipe[serves]"

      assert_select "input#recipe_cooking_time[name=?]", "recipe[cooking_time]"

      assert_select "input#recipe_difficulty[name=?]", "recipe[difficulty]"

      assert_select "textarea#recipe_ingredients[name=?]", "recipe[ingredients]"

      assert_select "textarea#recipe_procedure[name=?]", "recipe[procedure]"
    end
  end
end
