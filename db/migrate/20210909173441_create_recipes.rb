class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :recipe
      t.string :name
      t.string :image
      t.integer :calories
      t.integer :cell_id

      t.timestamps
    end
  end
end
