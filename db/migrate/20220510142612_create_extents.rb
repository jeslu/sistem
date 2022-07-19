class CreateExtents < ActiveRecord::Migration[7.0]
  def change
    create_table :extents do |t|
      t.string :extent
      t.string :slug
      t.boolean :active

      t.timestamps
    end
  end
end
