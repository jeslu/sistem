class Movimient < ApplicationRecord
  belongs_to :product

    MovimientType = {add: 0, remove: 1}
      validates :cant, numericality: true

      def self.get_movimient_types
        {
          'Agregar' -> MovimientType[:add],
          'Quitar' -> MovimientType[:remove]
        }
        
      end
      
      def movimient_type_name
        return "Agregar" if movimient_type == MovimientType[:add]
        return "Quitar" if movimient_type == MovimientType[:remove]
        
      end
      
      


end
