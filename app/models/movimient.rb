class Movimient < ApplicationRecord
  self.table_name = "movimients"
  belongs_to :product
  

    MovimientType = {add: 0, remove: 1}
      validates :cant, numericality: true

      def self.get_movimient_types
        {
          'Agregar' => MovimientType[:add],
          'Quitar' => MovimientType[:remove]
        }
        
      end
      
      def movimient_type_name
        return "Agregar" if tipo == MovimientType[:add]
        return "Quitar" if tipo == MovimientType[:remove]
        
      end
      
      


end
