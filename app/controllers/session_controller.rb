class SessionController < ApplicationController

  def new
    # render text: "Display the log in form."
    @messages = flash.map {| key, value| "#{key.capitalize}: #{value}"}.join(";")
  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      redirect_to root_url
    else
      # render text: "Who are you?"
      render :new
    end

  end

  def destroy
    # render text: "Log user out."
    session[:user_id] = nil
    redirect_to login_url, notice: "You've successfully logged out."
  end

end