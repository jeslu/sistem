class Supplier < ApplicationRecord
    self.table_name = "suppliers"
    has_many :products, dependent: :destroy
end
