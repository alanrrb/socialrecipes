class Cuisine < ActiveRecord::Base
  validates_presence_of :name
  has_many :recipes
end
