module ApplicationHelper
	def nombre_perfil(usuario)
		if usuario.perfil
			usuario.perfil.nombre
		else
			usuario.name
		end
	end

	def ciudad_perfil(usuario)
		if usuario.perfil
			usuario.perfil.ciudad
		else
			"Sin Especificar"
		end
	end

	def sexo_perfil(usuario)
		if usuario.perfil
			usuario.perfil.sexo
		else
			"Sin Especificar"
		end
	end

	def comprobar(params)
		!params[:asunto].blank? and !params[:mensaje].blank? and Email.enviar(params).deliver
	end

	def existe_amistad?(usuario, amigo)
		Amigo.existe_amistad?(usuario,amigo)
	end

	def link_amistad(usuario, amigo)
		hay_amistad = Amigo.existe_amistad?(usuario,amigo) 
		if Amigo.solicitud_enviada?(usuario,amigo) and !hay_amistad
			'<span class="glyphicon glyphicon-exclamation-sign text-warning"></span><span class="text-warning">Solicitud pendiente</span>'.html_safe
		elsif !hay_amistad
			link_to "+ Agregar amigos", {:controller => "amistad", :action => "crear", :id => amigo }, :confirm => "¿Realmente quiere solitar su amistad?" 
		else
			'<span class="glyphicon glyphicon-ok text-success">Amigo</span>'.html_safe
		end
	end
end
