class Mark < ApplicationRecord
    has_many :products, dependent: :destroy
    
end
