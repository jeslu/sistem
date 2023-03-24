class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.bigint :user_id
      t.bigint :client_id
      t.date :fecha
      t.decimal :import, precision: 12, scale: 2
      t.boolean :active

      t.timestamps
    end
  end
end
