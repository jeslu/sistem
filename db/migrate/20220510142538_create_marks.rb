class CreateMarks < ActiveRecord::Migration[7.0]
  def change
    create_table :marks do |t|
      t.string :mark
      t.string :slug
      t.boolean :active

      t.timestamps
    end
  end
end
