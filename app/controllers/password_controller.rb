class PasswordController < ApplicationController

  LINK_EXPIRED = "Your reset link has expired. Please generate a new one."

  def edit
    unless user_found
      redirect_to login_url, notice: LINK_EXPIRED
    end
  end

  def update
    if user_found
      password_scenarios
    else
      render text: "No code found"
    end
  end

  def password_confirmed
    UserNotifier.password_was_reset(@user).deliver
    log_user_in( @user, "Your password has been successfully reset" )
  end

  def password_scenarios
    if params[:user][:password].blank?
      PasswordResetter.password_blank

    elsif @user.reset_password( user_params )
      password_confirmed

    else
      PasswordResetter.new(flash).error_alert(@user)
      render :edit
    end
  end

  def user_found
    @user = User.find_by_code( params[:code] )
  end


  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end