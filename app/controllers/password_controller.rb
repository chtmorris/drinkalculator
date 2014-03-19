class PasswordController < ApplicationController

  LINK_EXPIRED = "Your reset link has expired. Please generate a new one."

  def edit
    unless @user = User.find_by_code( params[:code] )
      redirect_to login_url, notice: LINK_EXPIRED
    end
  end

  def update
    if @user = User.find_by_code( params[:code] )
    #if user is found
      if params[:user][:password].blank?

        @user.errors.add(:password, "can't be blank")
      elsif @user.update_attributes user_params
        render text: "Success"
      else
        render text: "Failure"
      end

    # Otherwise show a message not found
    else
      render text: "No code found"
    end

  end

  private

  def user_params
    params.require(:user).permit(:password,:password_confirmation)
  end

end