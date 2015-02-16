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
