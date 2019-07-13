class ApplicationMailer < ActionMailer::Base
  # default from: Rails.application.c`redentials.dig(:email, :mailbox)
  layout 'mailer'
end
