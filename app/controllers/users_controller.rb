class UsersController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!, :except => :show

  def index

  end

  def show
  	if params[:id]
    	@user = User.find_by(id: params[:id])
    else
    	@user = User.find_by(name: params[:nombre].capitalize)
    end
  end

  def contacto
    @destinatario = User.find(params[:id])

    if request.post?
      if comprobar(params)
        flash[:notice] = "Se ha enviado correctamente."
      else
        flash[:alert] = "Se ha producido un error al enviar el email."
      end
      redirect_to @destinatario
    end
  end
end
