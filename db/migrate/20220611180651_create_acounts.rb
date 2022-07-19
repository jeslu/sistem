class CreateAcounts < ActiveRecord::Migration[7.0]
  def change
    create_table :acounts do |t|
      t.references :client, null: false, foreign_key: true
      t.date :fecha
      t.text :description
      t.decimal :importe
      t.boolean :active

      t.timestamps
    end
  end
end
