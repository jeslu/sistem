class CreateMovimients < ActiveRecord::Migration[7.0]
  def change
    create_table :movimients do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :type
      t.integer :cant
      t.text :coment

      t.timestamps
    end
  end
end
