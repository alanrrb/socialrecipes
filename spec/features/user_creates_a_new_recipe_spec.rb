require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "User create a new recipe" do
  scenario "successfully" do
    FactoryGirl.create(:cuisine)
    FactoryGirl.create(:food_preference)
    FactoryGirl.create(:food_type)

    visit new_recipe_path

    login_as_user

    expect(page).to have_content 'New Recipe'

    fill_in 'recipe[name]', with: "recipe name"
    fill_in 'recipe[cooking_time]', with: "10"
    fill_in 'recipe[serves]', with: "10"
    select 'Fácil', from: 'Difficulty'
    select 'vegan', from: 'recipe[food_preference_id]'
    select 'breakfast', from: 'recipe[food_type_id]'
    select 'japonese', from: 'recipe[cuisine_id]'
    fill_in 'recipe[ingredients]', with: "fadfd adf adfd afdsf adfd "
    fill_in 'recipe[procedure]', with: "fdfdfa fd fdaf dfa"

    click_button 'Create Recipe'

    expect(page).to have_content 'recipe name'
  end
end

def login_as_user
  user = FactoryGirl.create(:user)
  fill_in 'user[email]', with: "test@test.com"
  fill_in 'user[password]', with: "12345678"
  click_button 'Log in'
end
