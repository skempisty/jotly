class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:current_user] = user.id
      redirect_to jots_path
    else
      redirect_to new_session_path, notice: "Invalid Login - Try Again"
    end
  end

  def logout
    session[:current_user] = nil
    redirect_to root_path
  end
end
