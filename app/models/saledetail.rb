class Saledetail < ApplicationRecord
    self.table_name = "saledetails"
    belongs_to :sale
    belongs_to :product
# validaciones donde  la id de producto no tiene que repetir solo si en diferente la venta
    
# optener el valor del importe
    def get_import
        self.cantidad * self.product.precio
        
    end
    
      
    
end
