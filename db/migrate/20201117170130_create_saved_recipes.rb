class CreateSavedRecipes < ActiveRecord::Migration
  def change
    create_table :saved_recipes do |t|
      t.string :user_id
      t.string :recipe_id
    end
  end
end
