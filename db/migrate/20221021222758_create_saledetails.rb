class CreateSaledetails < ActiveRecord::Migration[7.0]
  def change
    create_table :saledetails do |t|
      t.integer :cantidad
      t.references :sale, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
