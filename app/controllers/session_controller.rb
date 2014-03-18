class SessionController < ApplicationController

  def new
    redirect_to root_url, notice: "You are already logged in" if current_user
  end

  def create
    # @user = User.authenticate(params[:user][:email], params[:user][:password])
    user = User.find_by(email: params[:user][:email])
    password = params[:user][:password]

    if user and password.blank?
      user.set_password_reset
      UserNotifier.reset_password(user).deliver
      flash.now[:notice] = "We'll send you an e-mail..."
      render :new
    elsif user and user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_url
    else
      # render text: "Who are you?"
      flash.now[:alert] = "Unable to log you in.  Please check your email and password and try again."
      render :new
    end

  end

  def destroy
    # render text: "Log user out."
    session[:user_id] = nil
    redirect_to login_url, notice: "You've successfully logged out."
  end

end