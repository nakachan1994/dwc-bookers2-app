# Preview all emails at http://localhost:3000/rails/mailers/dairy_mailer
class DairyMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/dairy_mailer/daily_notification
  def daily_notification
    DairyMailer.daily_notification
  end

end
