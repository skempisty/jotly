class AdminsController < ApplicationController

  def edit_users
    @users=User.all
  end

end
