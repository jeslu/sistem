class Client < ApplicationRecord
  self.table_name = "clients"
    has_many :acounts, dependent: :destroy

    validates :name, :apellido, :cel, :direccion, presence:   { message: ':   el campo no tiene que estar en blanco' }
    validates :name, :apellido, uniqueness: {
      # object = person object being validated
      # data = { model: "Person", attribute: "Username", value: <username> }
      message: ->(object, data) do
        "Hey #{object.name}, #{data[:value]} ya esta elegido."
      end
    }

   def get_total
        self.acounts.where(active: 0).sum(:importe)
    end
end
