class Users::RegistrationsController < Devise::RegistrationsController
  def create
    # スーパークラス（devise)のcreateアクションを呼ぶ
    super
    # ThanksMailerクラスのsend_when_signupメソッドを呼び、POSTから受け取ったuserのnameとemailを渡す
    ThanksMailer.send_when_signup(params[:user][:email],params[:user][:name]).deliver
  end
end