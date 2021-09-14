class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cell_id
      t.integer :user_id
      t.integer :calories
      t.string :image
      t.string :recipe

      t.timestamps
    end
  end
end
