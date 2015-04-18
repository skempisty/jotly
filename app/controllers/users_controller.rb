class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
      user = User.create(params.require(:user).permit(:name))
      session[:current_user] = user.id
      redirect_to jots_path
  end

end
