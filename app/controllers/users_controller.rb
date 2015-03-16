class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
      User.create(params.require(:user).permit(:name))
      redirect_to root_path
  end

end
