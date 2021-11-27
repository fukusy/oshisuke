class ApplicationMailer < ActionMailer::Base
  default from: ENV['SENT_EMAILADDRESS']
  layout 'mailer'
end
