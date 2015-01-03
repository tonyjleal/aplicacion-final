class AmistadController < ApplicationController
  before_filter :authenticate_user!

  def crear
  	@usuario = current_user
  	@amigo = User.find(params[:id])
  	if !Amigo.existe_amistad?(@usuario,@amigo)
	  	#Solicitar amistad
	  	Amigo.solicitar_amistad(@usuario, @amigo)
  		#Email amigo
  		Email.solicitar_amistad(@usuario, @amigo).deliver
  		#Mostrar mensaje que se ha realizado correctamente
 		  flash[:notice] = "Tu solicitud de amistad ha sido enviada correctamente."
 	else
 		flash[:notice] = "#{@amigo.name.capitalize} y tú, ya sois amigos."
 	end
 	#Redirigir al perfil del usuario el cual estamos y mostrar mensaje
 	redirect_to @amigo
  end


  def aceptar
  	@amigo = User.find_by_name(params[:nombre])
  	Amigo.aceptar_amistad(@amigo, current_user)
  	Amigo.aceptar_amistad(current_user, @amigo)
  end

end
