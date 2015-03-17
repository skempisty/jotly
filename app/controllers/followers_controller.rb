class FollowersController < ApplicationController

  def create
    FollowerMailer.new_follower(follower).deliver


end
