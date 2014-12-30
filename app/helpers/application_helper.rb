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
end
