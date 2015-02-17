class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_categories

  private

  def set_categories
    @food_types = FoodType.all
    @food_preferences = FoodPreference.all
    @cuisines = Cuisine.all
  end
end
