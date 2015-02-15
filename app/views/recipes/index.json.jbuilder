json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :serves, :cooking_time, :difficulty, :ingredients, :procedure
  json.url recipe_url(recipe, format: :json)
end
