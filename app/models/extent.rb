class Extent < ApplicationRecord
    has_many :products, class_name: "product", foreign_key: "extent_id", dependent: :destroy
end
