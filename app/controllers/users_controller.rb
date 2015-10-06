class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:current_user] = @user.id
        redirect_to jots_path
      else
        render action: 'new'
      end
  end

  private
  def user_params
    params.require(:user).permit(
      :name, :password, :password_confirmation, :email)
  end
end
