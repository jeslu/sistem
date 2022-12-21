class CreateCotizs < ActiveRecord::Migration[7.0]
  def change
    create_table :cotizs do |t|
      t.bigint :client_id
      t.bigint :user_id
      t.date :fecha

      t.timestamps
    end
  end
end
