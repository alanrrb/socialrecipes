require 'factory_girl'
RSpec.configure do |config|
  # additional factory_girl configuration
  config.include FactoryGirl::Syntax::Methods

end

FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "12345678"
    password_confirmation "12345678"
  end

  factory :user1, class: "User" do
    email "user1@test.com"
    password "12345678"
    password_confirmation "12345678"
  end

  factory :user2, class: "User" do
    email "user2@test.com"
    password "12345678"
    password_confirmation "12345678"
  end

  factory :recipe_cake, class: "Recipe" do
    name "bolo de chocolade"
    cuisine
    food_type
    food_preference
    ingredients "açucar\nsal\nfarinha de trigo"
    procedure "cozinhe por 10 min\nsirva"
    user
  end

  factory :recipe do
    name "Bolinho de bacalhau"
    cuisine
    food_type
    food_preference
    ingredients "açucar\nsal\nfarinha de trigo"
    procedure "cozinhe por 10 min\nsirva"
    association :user, email: "recipe@test.com"
  end

  factory :cuisine do
    name "japonese"
  end
  factory :food_preference do
    name "vegan"
  end
  factory :food_type do
    name "breakfast"
  end
end
