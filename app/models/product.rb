class Product < ApplicationRecord
  belongs_to :category
  belongs_to :mark
  belongs_to :extent
  has_many :items
end
