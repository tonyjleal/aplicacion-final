class PerfilController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
	@usuario = User.find(current_user)
	@usuario.perfil ||= @usuario.build_perfil
	@perfil = @usuario.perfil
  end

  def update
		@usuario = User.find(current_user)
		@perfil = Perfil.new(perfiles_params)
		@usuario.perfil ||= @usuario.build_perfil

		respond_to do |format|
			if @usuario.create_perfil(perfiles_params)
				format.html {redirect_to @usuario, notice: 'Datos Actualizados'}
			else
				format.html { render action: "show" }
			end
		end
  end

  private 

	def perfiles_params
		params.require(:perfil).permit(:nombre, :apellidos, :sexo, :fecha_nacimiento, :ciudad)
	end


end
