class User < ActiveRecord::Base
  validates_presence_of :name, :city, :email
  has_many :recipes
  has_and_belongs_to_many :favorites, class_name: "Recipe"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
