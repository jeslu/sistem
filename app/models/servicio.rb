class Servicio < ApplicationRecord
    self.table_name = "servicios"
    has_many :Cotizdetails, class_name: "Cotizdetail", foreign_key: "servicio_id", dependent: :destroy


     validates :name_serv, :description, :costo_serv, presence: true
#se encarga de realizar una acción después de que un nuevo registro (creado con éxito) es guardado en la base de datos
     after_create_commit {broadcast_prepend_to "servicios"}
     after_destroy_commit {broadcast_remove_to "servicios"}

    def select_attributes
        "#{name_serv}.....$#{costo_serv}"
    end
end
