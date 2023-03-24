class CreateSaledetails < ActiveRecord::Migration[7.0]
  def change
    create_table :saledetails do |t|
      t.bigint :sale_id
      t.bigint :product_id
      t.integer :cantidad
      t.decimal :importe, precision: 12, scale: 2
      t.boolean :active

      t.timestamps
    end
  end
end
