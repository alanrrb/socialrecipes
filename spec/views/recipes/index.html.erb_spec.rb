require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Recipe.create!(
        :name => "Name",
        :serves => 1,
        :cooking_time => 2,
        :difficulty => "Difficulty",
        :ingredients => "MyText",
        :procedure => "MyProcedure"
      ),
      Recipe.create!(
        :name => "Name",
        :serves => 1,
        :cooking_time => 2,
        :difficulty => "Difficulty",
        :ingredients => "MyText",
        :procedure => "MyProcedure"
      )
    ])
  end

  it "renders a list of recipes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Difficulty".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyProcedure".to_s, :count => 2
  end
end
