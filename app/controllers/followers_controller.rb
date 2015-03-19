class FollowersController < ApplicationController

  # def create
  #   FollowerMailer.new_follower(follower).deliver
  def follow
    Follower.create(user_id: params[:publisher_id], subscriber_id: current_user.id)
    redirect_to jots_path
  end

  def unfollow
    @subscription = Follower.where(user_id: params[:publisher_id], subscriber_id: current_user.id)
    @subscription.delete_all
    redirect_to jots_path
  end

end
