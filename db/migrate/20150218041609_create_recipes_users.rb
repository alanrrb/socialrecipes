class CreateRecipesUsers < ActiveRecord::Migration
  def change
    create_table :recipes_users do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :user, index: true
    end
  end
end
