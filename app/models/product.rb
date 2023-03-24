class Product < ApplicationRecord
  self.table_name = "products"
  belongs_to :category
  belongs_to :mark
  belongs_to :extent
  belongs_to :supplier
  #associasion de movimientos
  has_many :movimients, dependent: :destroy
  #association de ventas
  #has_many :saledetails, dependent: :destroy
  has_many :sales, through: :saledetails
  
  #association de cotizaciones
  has_many :cotizs, through: :cotizdetails
  

#concatena los parametros de productos PARA mostrar en tu select_collection.
  def select_attributes
    "#{name_p}.....$#{precio}"
  end

  #logica de stock de  productos en sales o saledetails


  #logica de stock
  def stock
     #movimients.sum(:cant)
     total = 0
     self.movimients.each do |m|
      if m.tipo == Movimient::MovimientType[:add]
        total += m.cant
      else
        total -= m.cant
      end
    end
    return total
  end
end
