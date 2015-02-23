require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should return 20 last recipes" do
      20.times do
        FactoryGirl.create(:recipe)
      end
      get :index
      expect(assigns(:recipes).size).to eq(20)
    end

    it "should return only the 20 last ones" do
      @recipe = FactoryGirl.create(:recipe_cake)
      20.times do
        FactoryGirl.create(:recipe)
      end

      get :index
      expect(assigns(:recipes)).to_not include(@recipe)
    end


    it "should return the most favorites recipes" do
      @recipe1 = FactoryGirl.create(:recipe)
      @recipe2 = FactoryGirl.create(:recipe_cake)
      @recipe3 = FactoryGirl.create(:recipe)

      user = FactoryGirl.create(:user)
      user1 = FactoryGirl.create(:user1)

      @recipe1.users_who_liked << user
      @recipe1.users_who_liked << user1
      @recipe2.users_who_liked << user

      get :index
      most_favorites = assigns(:most_favorites)
      expect(most_favorites).to contain_exactly(@recipe1, @recipe2)
      expect(most_favorites).to_not include(@recipe3)
      expect(most_favorites).to start_with(@recipe1)
      expect(most_favorites).to end_with(@recipe2)
    end
  end
end
