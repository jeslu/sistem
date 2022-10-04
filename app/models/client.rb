class Client < ApplicationRecord
  self.table_name = "clients"
    has_many :acounts, dependent: :destroy

    validates :name, :apellido, :cel, :direccion, presence:   { message: ':   el campo no tiene que estar en blanco' }
    validates :name, :apellido, presence: {
      # object = person object being validated
      # data = { model: "Person", attribute: "Username", value: <username> }
      message: ->(object, data) do
        "Hey #{object.name}, #{data[:value]} ya esta elegido."
      end
    }

   def get_total
        self.acounts.where(active: 0).sum(:importe)
    end
    def self.get_optener_clientes_con_deuda()
      sql = "SELECT c.* from clients c
      WHERE c.id NOT IN (SELECT client_id FROM acounts WHERE active = 1)"
      self.find_by_sql(sql)
    end
    def self.get_optener_clientes_sin_deuda()
      sql = "SELECT c.* from clients c
      WHERE c.id NOT IN (SELECT client_id FROM acounts WHERE active = 0)"
      self.find_by_sql(sql)
    end
end
