class Product < ApplicationRecord
  belongs_to :category
  belongs_to :mark
  belongs_to :extent
  has_many :saledetails
  has_many :movimients, dependent: :destroy


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
