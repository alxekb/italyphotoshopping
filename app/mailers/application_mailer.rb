class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:email, :mailbox)
  layout 'mailer'
end
