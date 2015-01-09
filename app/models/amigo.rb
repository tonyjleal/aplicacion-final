class Amigo < ActiveRecord::Base
	belongs_to :user
	belongs_to :amistad, class_name: "User", foreign_key: "amigo_id"


	def self.solicitar_amistad(usuario, amigo)
		self.create(user_id: usuario.id, amigo_id: amigo.id, estado: "Pendiente")
		self.create(user_id: amigo.id, amigo_id: usuario.id, estado: "Solicitado")
	end

	def self.existe_amistad?(usuario, amigo)
		!find_by_user_id_and_amigo_id(usuario, amigo).nil? and
		usuario != amigo
	end

	def self.aceptar_amistad(usuario, amigo)
		fila = self.find_by_user_id_and_amigo_id(usuario.id, amigo.id)
		fila.estado = "Aceptado"
		fila.save!
	end

	def self.rechazar_amistad(usuario,amigo)
		fila = self.find_by_user_id_and_amigo_id(usuario.id, amigo.id)
		fila.estado = "Rechazado"
		fila.save
	end
end
