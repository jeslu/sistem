class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name_pro
      t.string :cel_pro
      t.string :direcction
      t.string :email_pro
      t.text :nota

      t.timestamps
    end
  end
end
