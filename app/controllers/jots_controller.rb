class JotsController < ApplicationController

  def index
    @jots = Jot.order('created_at').all
    @likes = Like.all
  end

  def new
    @jot = Jot.new
  end

  def create
    Jot.create(jot_params)
    redirect_to jots_path
  end

  def edit
    @jot = Jot.find(params[:id])
  end

  def update
    jot = Jot.find(params[:id])
    jot.update(jot_params)
    redirect_to jots_path
  end

  def destroy
    jot = Jot.find(params[:id])
    jot.destroy
    redirect_to jots_path
  end

  private
  def jot_params
    params.require(:jot).permit(
      :content, :photo).merge(
      user_id: session[:current_user])
  end



end
