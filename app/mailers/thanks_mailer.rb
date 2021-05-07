class ThanksMailer < ApplicationMailer
  def send_when_signup(email, name)
    @name = name
    mail to: email, subject: '会員登録が完了しました。'
  end
end
