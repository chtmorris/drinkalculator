class UserAuthenticator

  def initialize(session, flash)
    @flash = flash
    @session = session
  end

  def authenticate_user(params)
    if @user = User.authenticate(params[:email], params[:password])
      @session[:user_id] = @user_id
    else
      @flash.now[:alert] = "Unable to log you into the system, please try again."
    end
  end

end