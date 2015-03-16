class SessionsController < ApplicationController

  def new

  end

  def create
    if params[:user].present?
      if User.where(name: params[:user]).exists?
        user=User.find_by(name: params[:user])
        session[:current_user] = user.id
        redirect_to jots_path
      else
        redirect_to new_session_path, notice: "No user by that name"
      end
    end
  end

end
