class Mark < ApplicationRecord
    self.table_name = "marks"
    has_many :products, dependent: :destroy
    
    #validaciones
    validates :mark, uniqueness:  { 
    message: "YA EXITE ESTA MARCA..." }
end
