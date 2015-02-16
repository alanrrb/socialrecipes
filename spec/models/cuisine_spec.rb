require 'rails_helper'

RSpec.describe Cuisine, type: :model do
  it "should validates presence of name" do
    c = Cuisine.new
    expect(c).to_not be_valid
    c.name = "Japonese"
    expect(c).to be_valid
  end
end
