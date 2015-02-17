class FoodPreferencesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_food_preference, only: [:show, :edit, :update, :destroy]
  def new
    @food_preference = FoodPreference.new
  end

  def create
    @food_preference = FoodPreference.new(food_preference_params)
    if @food_preference.save
      redirect_to @food_preference, notice: 'Food Preference was successfully created.'
    else
      render :new
    end
  end

  def update
    if @food_preference.update(food_preference_params)
      redirect_to @food_preference, notice: 'Food Preference was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @food_preference.destroy
    redirect_to food_preference_url, notice: 'Food type was successfully destroyed.'
  end

  def edit
  end

  def index
    @food_preferences = FoodPreference.all
  end

  def show
  end

  private

  def set_food_preference
    @food_preference = FoodPreference.find(params[:id])
  end

  def food_preference_params
    params.require(:food_preference).permit(:name)
  end
end
