class AddCostoToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :costo, :decimal, precision: 12, scale: 2
  end
end
