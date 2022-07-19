class Mark < ApplicationRecord
    has_many :products, class_name: "product", foreign_key: "mark_id", dependent: :destroy
    #has_many :Catalogos, :class_name => "Producto::Catalogo", :foreign_key => "categoria_id"
end
