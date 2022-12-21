class CreateServicios < ActiveRecord::Migration[7.0]
  def change
    create_table :servicios do |t|
      t.string :name_serv
      t.string :description
      t.decimal :costo_serv, precision: 12, scale: 2
      t.boolean :active

      t.timestamps
    end
  end
end
