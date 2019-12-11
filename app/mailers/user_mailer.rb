class UserMailer < ApplicationMailer
  def div_payment
    @user = params[:user]
    @payment = params[:payment]
    mail(to: @user, subject: 'Votre part de la facture pour votre nanny')

  end
end
