class CreateCotizdetails < ActiveRecord::Migration[7.0]
  def change
    create_table :cotizdetails do |t|
      t.bigint :cotiz_id
      t.bigint :product_id
      t.bigint :servicio_id
      t.integer :cant
      t.decimal :total, precision: 12, scale: 2
      t.boolean :active

      t.timestamps
    end
  end
end
