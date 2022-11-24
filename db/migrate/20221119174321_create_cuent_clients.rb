class CreateCuentClients < ActiveRecord::Migration[7.0]
  def change
    create_table :cuent_clients do |t|
      t.bigint :client_id
      t.bigint :user_id
      t.date :fecha
      t.boolean :active

      t.timestamps
    end
  end
end
