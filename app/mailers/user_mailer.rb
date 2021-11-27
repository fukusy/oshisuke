class UserMailer < ApplicationMailer

  def send_when_create
    mail to: ENV['SENT_EMAILADDRESS'],
         subject: '【推しスケ】お問い合わせ'
  end

end
