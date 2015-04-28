class AdminsController < ApplicationController

  def edit_users
    @users=User.order('id desc').all
  end

  def promote_demote
    @user = User.find(params[:id])
    if @user.admin == false
      @user.update(admin: true)
    else
      @user.update(admin: false)
    end
    redirect_to :back
  end

  def sticky
    @jot = Jot.find(params[:id])
    if @jot.sticky == false
      @jot.update(sticky: true)
    else
      @jot.update(sticky: false)
    end
    redirect_to :back
  end

end
