class UserMailer < ApplicationMailer
  default  from: 'shop@ekaterinaivanova.com'

  def test_email
    @user = params[:user]
    @url = 'http://shop.ekaterinaivanova.com'
    mail(to: @user.email, subject: 'Welcome to the shop!')
  end
end