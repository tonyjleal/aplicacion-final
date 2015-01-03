class Email < ActionMailer::Base
  default from: "Rails - mensaje"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email.enviar.subject
  #
  def enviar(params)
    @asunto = params[:asunto]
    @mensaje = params[:mensaje]
    @destinatario = params[:destinatario]
    mail to: @destinatario, 
          subject: "Curso Rails - #{@asunto}"
  end


  def solicitar_amistad(usuario, amigo)
    @usuario = usuario
    @amigo = amigo
    @url = "https://warm-oasis-9425.herokuapp.com"
    mail to: @amigo.email,
          subject: "Solicitud de amistad de #{amigo.name}"
  end

end
