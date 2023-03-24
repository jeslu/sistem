class Cotiz < ApplicationRecord
    self.table_name = "cotizs" 
    belongs_to :client, class_name: "Client", foreign_key: "client_id"
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    has_many :cotizdetails, class_name: "Cotizdetail", foreign_key: "cotiz_id", dependent: :destroy
    has_many :products, through: :cotizdetails

    
    def get_total
        cotizdetails.to_a.sum {|cotizdetail| cotizdetail.get_valor_total}
        
    end

   
        
  
end
