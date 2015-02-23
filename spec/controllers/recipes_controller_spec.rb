require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  login_user

  let(:cuisine) {FactoryGirl.create(:cuisine)}
  let(:food_type) {FactoryGirl.create(:food_type)}
  let(:food_preference) {FactoryGirl.create(:food_preference)}

  let(:valid_attributes) {
    FactoryGirl.build(:recipe).attributes
  }

  let(:invalid_attributes) {
    {difficulty: "hard",
     name: ""}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all recipes as @recipes" do
      recipe = FactoryGirl.create(:recipe)
      get :index, {}, valid_session
      expect(assigns(:recipes)).to eq([recipe])
    end
  end

  describe "GET #show" do
    it "assigns the requested recipe as @recipe" do
      recipe = FactoryGirl.create(:recipe)
      get :show, {:id => recipe.to_param}, valid_session
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe "GET #new" do
    it "assigns a new recipe as @recipe" do
      get :new, {}, valid_session
      expect(assigns(:recipe)).to be_a_new(Recipe)
    end
  end

  describe "GET #edit" do
    it "assigns the requested recipe as @recipe" do
      recipe = FactoryGirl.create(:recipe)
      get :edit, {:id => recipe.to_param}, valid_session
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Recipe" do
        expect {
          post :create, {:recipe => valid_attributes}, valid_session
        }.to change(Recipe, :count).by(1)
      end

      it "assigns a newly created recipe as @recipe" do
        post :create, {:recipe => valid_attributes}, valid_session
        expect(assigns(:recipe)).to be_a(Recipe)
        expect(assigns(:recipe)).to be_persisted
      end

      it "redirects to the created recipe" do
        post :create, {:recipe => valid_attributes}, valid_session
        expect(response).to redirect_to(Recipe.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved recipe as @recipe" do
        post :create, {:recipe => invalid_attributes}, valid_session
        expect(assigns(:recipe)).to be_a_new(Recipe)
      end

      it "re-renders the 'new' template" do
        post :create, {:recipe => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "New name"}
      }

      let(:recipe) {FactoryGirl.create(:recipe)}

      it "updates the requested recipe" do
        put :update, {:id => recipe.to_param, :recipe => new_attributes}, valid_session
        recipe.reload
        expect(assigns(:recipe).name).to eq(recipe.name)
      end

      it "assigns the requested recipe as @recipe" do
        put :update, {:id => recipe.to_param, :recipe => valid_attributes}, valid_session
        expect(assigns(:recipe)).to eq(recipe)
      end

      it "redirects to the recipe" do
        put :update, {:id => recipe.to_param, :recipe => valid_attributes}, valid_session
        expect(response).to redirect_to(recipe)
      end
    end

    context "with invalid params" do
      it "assigns the recipe as @recipe" do
        recipe = FactoryGirl.create(:recipe)
        put :update, {:id => recipe.to_param, :recipe => invalid_attributes}, valid_session
        expect(assigns(:recipe)).to eq(recipe)
      end

      it "re-renders the 'edit' template" do
        recipe = FactoryGirl.create(:recipe)
        put :update, {:id => recipe.id, :recipe => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested recipe" do
      recipe = FactoryGirl.create(:recipe)
      expect {
        delete :destroy, {:id => recipe.to_param}, valid_session
      }.to change(Recipe, :count).by(-1)
    end

    it "redirects to the recipes list" do
      recipe = FactoryGirl.create(:recipe)
      delete :destroy, {:id => recipe.to_param}, valid_session
      expect(response).to redirect_to(recipes_url)
    end
  end

end
