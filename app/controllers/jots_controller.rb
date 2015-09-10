class JotsController < ApplicationController

  def index
    @likes = Like.all
    @jots = Jot.order('sticky DESC').order('created_at DESC')
      .page(params[:page]).per_page(15).all

  end


  def new
    @jot = Jot.new
  end

  def create
    jot=Jot.create(jot_params)
    # JotMailer.send_to_followers(jot).deliver_later
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
    redirect_to :back
  end

  def followed
    @followed_users = Follower.where(subscriber_id: current_user.id)
    follow_ids = []

    @followed_users.each do |user|
      follow_ids << user.user_id
    end

    @followed_jots = Jot.order('sticky').order('created_at').where(user_id: follow_ids).reverse
  end

  def my_jots
    @my_jots = Jot.order('sticky').order('created_at').where(user_id: current_user.id)
  end

  def jots_search
    if User.where(name: params[:search]).blank?

    else
      puts user = User.where(name: params[:search])
      @searched_result = Jot.order('sticky').order('created_at')
        .where(user_id: user.id)
        .page(params[:page]).per_page(15).all
    end
  end

  private
  def jot_params
    params.require(:jot).permit(
      :title, :content, :photo).merge(
      user_id: session[:current_user])
  end
end
