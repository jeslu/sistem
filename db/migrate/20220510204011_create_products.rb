class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name_p
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.references :mark, null: false, foreign_key: true
      t.references :extent, null: false, foreign_key: true
      t.string :code
      t.integer :stok
      t.decimal :precio
      t.boolean :active

      t.timestamps
    end
  end
end
