class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.decimal :import, precision: 12, scale: 2
      t.bigint :user_id

      t.timestamps
    end
  end
end
