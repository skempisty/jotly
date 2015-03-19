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

  def followed
    @follower_objects=Follower.where(subscriber_id: current_user.id)
    # @followed_user_ids = []

    # follower_objects.each do |f|
    #   @followed_user_ids.push(f.user.id)
    # end


  end





  private
  def jot_params
    params.require(:jot).permit(
      :content, :photo).merge(
      user_id: session[:current_user])
  end



end
