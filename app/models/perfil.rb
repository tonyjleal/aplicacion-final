class Perfil < ActiveRecord::Base
	belongs_to :user

	CAMPOS = %w(nombre apellidos sexo ciudad)
	SEXO = ["Hombre", "Mujer"]

	validates :nombre, :apellidos, :sexo, :fecha_nacimiento, :ciudad, :presence => true

	#Tamaños
	validates :nombre, :apellidos, length: { :maximum => 30, :minimum => 4 }, format: { with: /\A[a-zA-Z]+\z/, message: "Solamente letras, por favor"}

	validates :ciudad, length: {:maximum => 30}, format: { with: /\A[a-zA-Z]+\z/ , message: "Solamente letras, por favor"}

	validates :sexo, inclusion: {:in => SEXO}
end
