class Recipe < ActiveRecord::Base
  validates_presence_of :name, :cuisine, :food_type, :food_preference, :ingredients, :procedure
  belongs_to :food_preference
  belongs_to :food_type
  belongs_to :cuisine
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
