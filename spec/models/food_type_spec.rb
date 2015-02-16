require 'rails_helper'

RSpec.describe FoodType, type: :model do
  it "should validates presence of name" do
    ft = FoodType.new
    expect(ft).to_not be_valid
    ft.name = "vegan"
    expect(ft).to be_valid
  end
end
