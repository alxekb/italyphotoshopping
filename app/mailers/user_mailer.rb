# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'robot@ekaterinaivanova.com'
  # require 'sendgrid-ruby'
  # include SendGrid

  def test_email
    @user = params[:user]
    @url = 'http://shop.ekaterinaivanova.com'
    mail(to: @user.email, subject: 'Welcome to the shop!')
  end

  def sengrid_template
    from = Email.new(email: 'robot@ekaterinaivanova.com')
    to = Email.new(email: 'alx.ekb@gmail.com')
    subject = 'Sending with SendGrid is Fun'
    content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: Rails.application.credentials.dig(:sendgrid, :api_key))
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.header
  end
end
