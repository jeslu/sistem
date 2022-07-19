class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :apellido
      t.string :cel
      t.string :direccion
      t.boolean :active

      t.timestamps
    end
  end
end
