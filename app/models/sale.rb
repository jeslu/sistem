class Sale < ApplicationRecord
  self.table_name = "sales"
  belongs_to :user
  belongs_to :client, optional: true
  has_many :items, dependent: :destroy
end
