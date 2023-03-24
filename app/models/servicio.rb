class Servicio < ApplicationRecord
    self.table_name = "servicios"
    has_many :Cotizdetails, class_name: "Cotizdetail", foreign_key: "servicio_id", dependent: :destroy


    def select_attributes
        "#{name_serv}.....$#{costo_serv}"
    end
end
