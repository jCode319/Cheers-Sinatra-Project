class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.text :directions
      t.string :type
      t.integer :user_id
    end
  end
end
