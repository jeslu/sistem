class Saledetail < ApplicationRecord
  self.table_name = "saledetails"
  belongs_to :sale
  belongs_to :product, dependent: :destroy
  
  def get_import
    self.cantidad * self.product.precio
  end

  
end
