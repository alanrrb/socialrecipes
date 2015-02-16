class Recipe < ActiveRecord::Base
  validates_presence_of :name, :cuisine, :food_type, :food_preference, :ingredients, :procedure
  belongs_to :food_preference
  belongs_to :food_type
  belongs_to :cuisine
end
