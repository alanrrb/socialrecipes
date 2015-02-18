class HomeController < ApplicationController
  def index
    @recipes = Recipe.all.limit(20)
    @most_favorites = Recipe.most_favorites
  end
end
