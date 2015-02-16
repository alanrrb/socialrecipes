class Recipe < ActiveRecord::Base
  belongs_to :food_preference
  belongs_to :food_type
  belongs_to :cuisine
end
