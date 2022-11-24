class CuentClient < ApplicationRecord
    self.table_name = "cuent_clients"
    belongs_to :User, :class_name => "User", :foreign_key => "user_id"
    belongs_to :Client, :class_name => "Client", :foreign_key => "client_id"
end
