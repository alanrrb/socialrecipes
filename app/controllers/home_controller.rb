class HomeController < ApplicationController
  def index
    @recipes = Recipe.last(20)
    @most_favorites = Recipe.most_favorites
  end
end
