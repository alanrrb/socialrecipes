require 'rails_helper'

RSpec.describe FoodPreference, type: :model do
  it "should validates presence of name" do
    fp = FoodPreference.new
    expect(fp).to_not be_valid
    fp.name = "preference"
    expect(fp).to be_valid
  end
end
