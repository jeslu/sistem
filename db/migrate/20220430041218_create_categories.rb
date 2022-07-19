class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :category
      t.string :slug
      t.boolean :active

      t.timestamps
    end
  end
end
