class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      #Create an error message
      redirect_to login_path, :flash => { :error => "Incorrect username or password" }
    end
  end

  def destroy
    log_out
    redirect_to request.referrer
  end
end
