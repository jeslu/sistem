class Sale < ApplicationRecord
    self.table_name = "sales"
    has_many :saledetails, dependent: :destroy
    has_many :products, :through => :saledetails
    belongs_to :client, optional: true
    belongs_to :user, optional: true #:class_name => "User", :foreign_key => "user_id"
   # has_many :CuentaClientes, :class_name => "Ct::CuentaCliente", :foreign_key => "user_id"

  
end
