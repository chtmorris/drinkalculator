class UserNotifier < ActionMailer::Base

  default from: "Drinkalculator <webmaster@drinkalculator.com>"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "[Drinkalculator] Reset your credentials"
  end

  def password_was_reset(user)
    @user = user
    mail to: @user.email, subject: "[Drinkalculator] Your password was reset"
  end

end
