class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.date :fecha
      t.decimal :total, precision: 12, scale: 2
      t.boolean :active

      t.timestamps
    end
  end
end
