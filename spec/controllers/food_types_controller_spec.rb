require 'rails_helper'

RSpec.describe FoodTypesController, type: :controller do
  login_admin

  describe "GET #index" do
    it "assigns all food types as @food_types" do
      food_type = FactoryGirl.create(:food_type)
      get :index
      expect(assigns(:food_types)).to eq([food_type])
    end
  end

  describe "GET :show" do
    it "assigns the resquestd food type as @food_type" do
      food_type = FactoryGirl.create(:food_type)
      get :show, id: food_type.id
      expect(assigns(:food_type)).to eq(food_type)
    end
  end

end
