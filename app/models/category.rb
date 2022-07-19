class Category < ApplicationRecord
    has_many :products, class_name: "product", foreign_key: "category_id", dependent: :destroy
end
