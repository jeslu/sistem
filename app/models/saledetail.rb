class Saledetail < ApplicationRecord
  belongs_to :sale
  belongs_to :product,dependent: :destroy


  
end
