class Acount < ApplicationRecord
  self.table_name = "acounts"
  belongs_to :client

  #validaciones
  validates :description, :importe, :fecha, presence:   { message: ':   el campo no tiene que estar en blanco' }
  
end
