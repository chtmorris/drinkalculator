class SessionController < ApplicationController

  def new
    # render text: "Display the log in form."
  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      render text: "Logged in yo! #{@user.email}"
    else
      render text: "Who are you?"
    end

  end

  def destroy
    render text: "Log user out."
  end

end