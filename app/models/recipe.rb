class Recipe < ActiveRecord::Base
  validates_presence_of :name, :cuisine, :food_type, :food_preference, :ingredients, :procedure
  has_and_belongs_to_many :users_who_liked, class_name: "User"
  belongs_to :food_preference
  belongs_to :food_type
  belongs_to :cuisine
  belongs_to :user
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def self.most_favorites
    joins(:users_who_liked).select("count(*) as num_of_favorites, recipes.*").group("recipes_users.recipe_id").order("1 desc")
  end
end
