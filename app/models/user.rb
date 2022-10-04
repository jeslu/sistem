class User < ApplicationRecord
  has_many :acounts, class_name: "acount", foreign_key: "user_id", dependent: :destroy
  has_many :sales, class_name: "sale", foreign_key: "user_id", dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 #  listado de posibles opciones en un arreglo.
 enum role: [:user,:moderator, :admin]
  # despues de inicializar dicha funcion 
  after_initialize  :set_default_role, :if => :new_record?
  # :new_record? usamos para verificar si el objeto se guarda o no
  def set_default_role
    self.role ||= :user
    
  end
  
  
end
