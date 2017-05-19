class UserMailer < ApplicationMailer
  default from: "admin@scavenger.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Scavenger')
  end
end
