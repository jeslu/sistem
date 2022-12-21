class Cotizdetail < ApplicationRecord
    belongs_to :cotiz, class_name: "Cotiz", foreign_key: "cotiz_id"
    belongs_to :product, class_name: "Product", foreign_key: "product_id",optional: true
    belongs_to :servicio, class_name: "Servicio", foreign_key: "servicio_id", optional: true
    

 #optemgo el valor importe de servicios y productos
    def get_valor_total
        if self.product.blank?
            total_s = self.cant * self.servicio.costo_serv
        else
            total_p = self.cant * self.product.precio

        end
      
    end
#actualizar el import de cada productos o servicios en la tabla cotizadetails
    def update_total
        @cotiz.Cotizdetails.each do |item|
            total_impor = self.cant * self.Product.precio || total_s = self.cant * self.Servicio.costo_serv
            item.update(total: total_impor)
        end
    end
    
  
    
end
