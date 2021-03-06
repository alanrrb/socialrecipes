class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :favorites]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :favorites, :friend_recipe]

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  def favorites
    user = current_user
    user.favorites << @recipe
    redirect_to @recipe
  end

  def categories
    category = params[:category].to_sym
    @recipes = Recipe.where(category => params[:id])
    @type_name = @recipes.first.send(category).name unless @recipes.size == 0
    render template: "recipes/index"
  end

  # GET /recipes/1
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    set_relationship
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  def friend_recipe
    user = current_user
    email = params[:email]
    message = params[:message]
    FriendMailer.recipe_mail(email, user, @recipe, message).deliver
    render :nothing => true
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_relationship
    @recipe.user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:name, :serves, :cooking_time, :difficulty, :ingredients, :procedure, :food_preference_id, :food_type_id, :cuisine_id, :photo)
  end
end
