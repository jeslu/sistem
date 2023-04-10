class Sale < ApplicationRecord
    self.table_name = "sales"
    belongs_to :client, class_name: "Client", foreign_key: "client_id", optional: true
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    has_many :saledetails,  dependent: :destroy
    has_many :products, through: :saledetails

    #calcular el total de dicha venta
    def get_sale_total
        saledetails.to_a.sum {|saledetail| saledetail.get_import}
        
    end
    #calcular el stock
    

end
