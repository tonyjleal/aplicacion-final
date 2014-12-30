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
end
