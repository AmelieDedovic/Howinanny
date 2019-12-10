# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def div_payment
    user = User.first
    # This is how you pass value to params[:user] inside mailer definition!
    UserMailer.with(user: user).div_payment
  end

end
