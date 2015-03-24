class JotsController < ApplicationController

  def index
    @jots = Jot.order('created_at').all
    @likes = Like.all
  end

  def new
    @jot = Jot.new
  end

  def create
    jot=Jot.create(jot_params)
    JotMailer.send_to_followers(jot).deliver_later
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
    @followed_jots = []

    @follower_objects.each do |f|
      f.user.name
      f.user.jots.each do |jot|
        @followed_jots.push(jot)
      end
    end
  end

  def my_jots
    @my_jots = Jot.where(user_id: current_user.id)
  end

  private
  def jot_params
    params.require(:jot).permit(
      :content, :photo).merge(
      user_id: session[:current_user])
  end
end
