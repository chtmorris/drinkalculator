class RegisterController < ApplicationController

BLANK_FIELDS = "You have left one of the registration fields blank. Please fill in all fields and re-submit."
ALREADY_REGISTERED = "This e-mail address is already registered. You can reset your password from the home page if you have forgotten it."
NON_MATCHING_PASSWORDS = "Your passwords do not match. Please try again."

  def new_user
  end

  def registration
    if (params[:user][:email].blank? or params[:user][:password].blank? or params[:user][:password_confirmation].blank?)
      flash.now[:alert] = BLANK_FIELDS
    elsif params[:user][:email] == User.find_by( params[:email] )
      flash.now[:alert] = ALREADY_REGISTERED
    elsif (params[:user][:password] != params[:user][:password_confirmation])
      flash.now[:alert] = NON_MATCHING_PASSWORDS
    else
      #authenticate password flow
      return if log_user_in( UserAuthenticator.new(session, flash).authenticate_user(user_params) )
    end
    # (redirect_to root_url and return) if flash.empty?
    render :new_user

  end

end