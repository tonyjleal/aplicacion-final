class PerfilController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
	@usuario = User.find(current_user)
	@usuario.build_perfil if @usuario.perfil.nil?
	@perfil = @usuario.perfil
  end

  def update
		@usuario = User.find(current_user)
		@usuario.build_perfil if @usuario.perfil.nil?

		respond_to do |format|
			if request.put?
				if(@usuario.perfil.id.nil?)
					if @usuario.create_perfil(perfiles_params).save
						format.html {redirect_to @usuario, notice: 'Perfil creado correctamente'}
					else
						@perfil = @usuario.perfil
						format.html { render action: "show" }
					end
				else
					if @usuario.perfil.update_attributes(perfiles_params)
						format.html {redirect_to @usuario, notice: 'Datos actualizados correctamente'}
					else
						@perfil = @usuario.perfil
						format.html { render action: "show" }
					end
				end
			end
		end
  end

  private 

	def perfiles_params
		params.require(:perfil).permit(:nombre, :apellidos, :sexo, :fecha_nacimiento, :ciudad)
	end


end
