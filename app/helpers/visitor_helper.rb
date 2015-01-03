module VisitorHelper
	def ciudad_usuario(usuario)
		if usuario.perfil
			usuario.perfil.ciudad
		else
			"Sin especificar"
		end
	end

#revisar
	def link_amistad(usuario, amigo)
		hay_amistad = Amigo.existe_amistad?(usuario,amigo) 
		if Amigo.solicitud_enviada?(usuario,amigo) and !hay_amistad
			'<span class="glyphicon glyphicon-exclamation-sign text-warning">Pendiente</span>'.html_safe
		elsif !hay_amistad
			link_to "+ Agregar amigos", {:controller => "amistad", :action => "crear", :id => amigo }, :confirm => "¿Realmente quiere solitar su amistad?" 
		else
			'<span class="glyphicon glyphicon-ok text-success">Amigo</span>'.html_safe
		end
	end
		
end